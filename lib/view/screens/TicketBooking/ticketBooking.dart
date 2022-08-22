

// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:museum/models/appColor.dart';
import 'package:museum/view/payment/payment.dart';
class BookTickets extends StatefulWidget {
  final String name;
  final int price;
  const BookTickets({ Key? key, required this.name, required this.price }) : super(key: key);

  @override
  State<BookTickets> createState() => _BookTicketsState();
}

class _BookTicketsState extends State<BookTickets> {

  
  int count=1;
  TextEditingController name = TextEditingController();
  TextEditingController musiname = TextEditingController();
  TextEditingController price = TextEditingController();
  List<TextEditingController> _controllers = [];
  List<TextField> _fields = [];
  TextEditingController age = TextEditingController();
  TextEditingController date = TextEditingController();
  var firebaseUser = FirebaseAuth.instance.currentUser;
  var firebase = FirebaseFirestore.instance.collection("Users");
   @override
  void dispose() {
    for (final name in _controllers) {
      name.dispose();
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor:Colors.orange[300],
      appBar: AppBar(
        actions: [
          TextButton.icon(
            // ignore: prefer_const_constructors
            
            onPressed: (){
               setState(() {
                final field = TextField(
      controller: name,
      readOnly: false,
      // onTap: tap,
      // ignore: prefer_const_constructors
      decoration: InputDecoration(
        fillColor: Colors.grey,
        border: InputBorder.none,
        filled: true,
        
        hintText: "Name"));
                _controllers.add(name);
              //  _fields.add(field);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: Duration(milliseconds: 500),
                              content: Text("Ticket - ${count +1} Added")));
                             count++;
                           });
            }, icon: Icon(Icons.add,color: AppColors.colText,), label: Text("Add",style: TextStyle(color: AppColors.colText),),)
          
        ],
      backgroundColor: Colors.black,
        title: Text("Book Tickets"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: count,
              itemBuilder: (context,index) {
                _controllers.add(name);
                return Card(
                  color: Colors.white,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text("Ticket -${index+1}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        
                        TicketTextFields(tit: widget.name, tap: () {  }, read: true, cont: musiname,),
                        SizedBox(height: 20,),
                        TicketTextFields(tit: 'Name:', tap: () {  }, read: false, cont: _controllers[index],),
                        SizedBox(height: 20,),
                        TicketTextFields(tit: 'Age:', tap: () {  }, read: false, cont: age,),
                        SizedBox(height: 20,),
                        TicketTextFields(tit: '${widget.price}', tap: () {  }, read: true, cont: price,),
                        SizedBox(height: 20,),
                        TicketTextFields(tit: 'Date:', tap: () async{  
                          DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    
                    lastDate: DateTime(2100));
 
                if (pickedDate != null) {
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                  setState(() {
                    date.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else {}
              
                          
                        }, read: true, cont: date,),
                      ],
                    ),
                  ),
                );
              }
            ),
          ),
        
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: double.infinity,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                              ),
                          color: AppColors.appBarColor,
                          onPressed: (){
                            firebase.doc(firebaseUser!.uid).collection("Tickets").add({
                              "Museum Name":widget.name,
                            "Name": name.text,
                            "Age": age.text,
                            "Date": date.text,
                            "Price": widget.price,
                            "id":firebase.doc(firebaseUser!.uid).collection("Tickets").doc().id
                            }).whenComplete(() {print("added");
                            showAboutDialog(context: context,
                children: [
                  Lottie.network("https://assets1.lottiefiles.com/packages/lf20_zwkm4xbs.json",
                  
  height: 200,

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text("Tickets Confirmed"),
                    ],
                  )
                ]);
                            ;});
                            //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Payment())
                             
                            //  );
                          },
                        child: Text("Book Tickets",style: TextStyle(color: AppColors.colText),),
                        ),
                      ),
                    )
        ],
      ),
      
      
    );
  }
}

class TicketTextFields extends StatelessWidget {
  final TextEditingController cont;
  final String tit;
  final bool read;
  final VoidCallback tap;
  const TicketTextFields({
    Key? key, required this.tit, required this.tap, required this.read, required this.cont,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return TextField(
      
      controller: cont,
      readOnly: read,
      onTap: tap,
     
      decoration: InputDecoration(
        fillColor: Colors.grey,
        border: InputBorder.none,
        filled: true,
        
        hintText: tit),
    );
  }
}