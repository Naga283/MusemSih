
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:museum/view/screens/homeScreen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';





enum MobileVerificationState { SHOW_MOBILE_FORM_STATE, SHOW_OTP_FORMS_STATE }

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  String phoneNumber = "+91";

  void _onCountryChange(CountryCode countryCode) {
    this.phoneNumber = countryCode.toString();
    print("New Country selected: " + countryCode.toString());
  }

  void check() {
    print("Full Text: " + this.phoneNumber + _phoneController.text);
  }

  String verificationId = "";
  bool isLoading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;

  void alert() {
    if (_phoneController.text == "") {
      Alert(
              context: context,
              title: "PhoneNumber Required",
              desc: "Please enter Phone No.")
          .show();
    } else {
      setState(() {
        isLoading = true;
      });
    }
  }

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      isLoading = true;
    });
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        isLoading = false;
      });
      if (authCredential.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    } on FirebaseException catch (e) {
      setState(() {
        isLoading = false;
      });
      _scaffoldKey.currentState!
          // ignore: deprecated_member_use
          .showSnackBar(SnackBar(content: Text("${e.message}")));
    }
  }

  getMobileFormWidget(context) {
    return Column(
      children: [
        Spacer(),
        // TextFormField(
        //   controller: _phoneController,
        //   decoration: InputDecoration(
        //     hintText: "Enter Phone Number",
        //   ),
        // ),
        Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          children: [
            CountryCodePicker(
              onChanged: _onCountryChange,
              initialSelection: 'IN',
              favorite: ['+91', 'IN'],
              // optional. Shows only country name and flag
              showCountryOnly: false,
              // optional. Shows only country name and flag when popup is closed.
              showOnlyCountryWhenClosed: false,
              // optional. aligns the flag and the Text left
              // alignLeft: false,
              enabled: true,
            ),
            Container(
              width: 150,
              child: TextField(
                
                controller: _phoneController,
                decoration: InputDecoration(hintText: "Enter Phone Number"),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        // ignore: deprecated_member_use
        Center(
          child: FlatButton(
            color: Colors.blueAccent,
            onPressed: () async {
              check();
              // alert();
              await _auth.verifyPhoneNumber(
                  phoneNumber: this.phoneNumber + _phoneController.text,
                  verificationCompleted: (phoneAuthCredential) async {
                    setState(() {
                      isLoading = false;
                    });
                    // signInWithPhoneAuthCredential();
                  },
                  verificationFailed: (verificationFailed) async {
                    setState(() {
                      isLoading = false;
                    });
                    // ignore: deprecated_member_use
                    _scaffoldKey.currentState!.showBottomSheet(
                        (context) => Text("${verificationFailed.message}"));
                  },
                  codeSent: (verificationId, resendingToken) async {
                    setState(() {
                      setState(() {
                        isLoading = false;
                      });
                      currentState =
                          MobileVerificationState.SHOW_OTP_FORMS_STATE;
                      this.verificationId = verificationId;
                    });
                  },
                  codeAutoRetrievalTimeout: (verificationId) async {});
            },
            child: Text("Send OTP",style: TextStyle(color: Colors.white)),
          ),
        ),
        Spacer(),
      ],
    );
  }

  getOtpFormWidget(context) {
    return Column(
      children: [
        Spacer(),
        TextFormField(
          controller: _otpController,
          decoration: InputDecoration(hintText: "Enter Otp"),
        ),
        SizedBox(
          height: 16,
        ),
        // ignore: deprecated_member_use
        FlatButton(
            color: Colors.blueAccent,
            onPressed: () {
              PhoneAuthCredential phoneAuthCredential =
                  PhoneAuthProvider.credential(
                      verificationId: verificationId,
                      smsCode: _otpController.text);

              signInWithPhoneAuthCredential(phoneAuthCredential);
            },
            child: Text("Verify",style: TextStyle(color: Colors.white),)),
        Spacer()
      ],
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(16),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                ? getMobileFormWidget(context)
                : getOtpFormWidget(context),
      )),
    );
  }
}
