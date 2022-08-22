
// ignore_for_file: prefer_const_constructors

import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:museum/models/appColor.dart';
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
    return Center(
      child: ListView(
        
        children: [
          Image.asset("assets/images/monumnet.png",height: 100,),
          SizedBox(height: 10,),
          Text("Enter your \n mobile number",style: TextStyle(color: AppColors.colText,fontSize: 30,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
    
          SizedBox(height: 20,),
        Text("We'll text you a verfication code.\nMessage and data rates may apply",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white60,),textAlign: TextAlign.center,),
        SizedBox(height: 40,),
        InternationalPhoneNumberInput(
          
          // inputDecoration: InputDecoration(),
          inputDecoration: InputDecoration(filled: true,
                fillColor: Color(0XFF353131),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color(0XFFC6B26A),
                    width: 10.0,
                  style: BorderStyle.solid,
                )
                
                ),
          hintText: "Enter Phone Number",
                 hintStyle: TextStyle(color: Color(0XFFC6B26A),fontWeight: FontWeight.bold)
                ),
          textStyle: TextStyle(color: Color(0XFFC6B26A),),
          onInputChanged: (PhoneNumber number) {
            print(number.phoneNumber);
          },
          onInputValidated: (bool value) {
            print(value);
          },
          selectorConfig: SelectorConfig(
            setSelectorButtonAsPrefixIcon: true,
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          ),
          ignoreBlank: false,
          autoValidateMode: AutovalidateMode.disabled,
          selectorTextStyle: TextStyle(color: Color(0XFFC6B26A),),
          // initialValue: number,
          textFieldController: _phoneController,
          formatInput: false,
          keyboardType:
              TextInputType.numberWithOptions(signed: true, decimal: true),
          inputBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          onSaved: (PhoneNumber number) {
            print('On Saved: $number');
          },
        ),
     
          SizedBox(
            height: 40
          ),
          // ignore: deprecated_member_use
          Center(
            child: ElevatedButton(
             style: ElevatedButton.styleFrom(
              minimumSize: Size(150, 50),
              primary: Color(0XFF353131),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  style: BorderStyle.solid,
                  width: 2.0,
                  color: Color(0XFFC6B26A)
                ),
                borderRadius: BorderRadius.circular(10)
              )
             ),
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
              child: Text("Continue",style: TextStyle(color: Color(0XFFC6B26A),fontSize: 20)),
            ),
          ),
          
        ],
      ),
    );
  }

  getOtpFormWidget(context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
                Text("Enter your \n 6 digit OTP number",style: TextStyle(color: AppColors.colText,fontSize: 30,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
        SizedBox(height: 20,),
        TextFormField(
          controller: _otpController,
             style: TextStyle(color: AppColors.colText),
                
                decoration: InputDecoration(
                
                  filled: true,
                  fillColor: Color(0XFF353131),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Color(0XFFC6B26A),
                      width: 10.0,
                    style: BorderStyle.solid
                  )),
                  
                  hintText: "Enter OTP",
                  hintStyle: TextStyle(color: Color(0XFFC6B26A))
                  ),
        ),
       
        SizedBox(
          height: 25,
        ),
        // ignore: deprecated_member_use
        ElevatedButton(
            style: ElevatedButton.styleFrom(
            minimumSize: Size(150, 50),
            primary: Color(0XFF353131),
            shape: RoundedRectangleBorder(
              
              side: BorderSide(
                style: BorderStyle.solid,
                width: 2.0,
                color: Color(0XFFC6B26A)
              ),
              borderRadius: BorderRadius.circular(10)
            )
           ),
            onPressed: () {
              PhoneAuthCredential phoneAuthCredential =
                  PhoneAuthProvider.credential(
                      verificationId: verificationId,
                      smsCode: _otpController.text);

              signInWithPhoneAuthCredential(phoneAuthCredential);
            },
            child: Text("Verify",style: TextStyle(color: Color(0XFFC6B26A),fontSize: 20),)),
        Spacer()
      ],
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
