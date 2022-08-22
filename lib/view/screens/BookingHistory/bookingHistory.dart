// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:museum/models/appColor.dart';
import 'package:museum/view/screens/BookingHistory/ticketsBooked.dart';
class BookingHistory extends StatefulWidget {
  const BookingHistory({Key? key}) : super(key: key);

  @override
  State<BookingHistory> createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory> {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  var firebaseCollection = FirebaseFirestore.instance.collection("Users");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBarColor,
      appBar: AppBar(title: Text("Booking History",style: TextStyle(color: AppColors.colText),),backgroundColor: AppColors.appBarColor,),
      body: StreamBuilder(
        stream: firebaseCollection.doc(firebaseUser!.uid).collection("Tickets").snapshots(),
        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
        
return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    SizedBox(height:20,),
    
    Text("Recent Bookings",style: TextStyle(color: Color(0XFFC6B26A),fontSize: 18,),),
    SizedBox(height: 20,),
        Expanded(
          child: ListView.builder(
            
              itemCount: snapshot.hasData?snapshot.data!.docs.length:0,
            
              itemBuilder: (context,index){
            
              
            
              return InkWell(
            
          onTap: (){
            
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TIcketsBooked(ind: index,)));
            
          },
            
          child: Column(
            
            children: [
            
              SizedBox(height: 20,),
            
              Card(
            
                elevation: 10,
            
                shape: RoundedRectangleBorder(
            
                  borderRadius: BorderRadius.circular(20)
            
                ),
            
                child: Container(
            
                  height: MediaQuery.of(context).size.height * 0.1,
            
                  margin: const EdgeInsets.only(left:10,top: 20,bottom: 20),
            
                  child: Row(
            
                   
            
                    children: [
            
                      Icon(FontAwesomeIcons.museum,size: 50,color: Color.fromARGB(255, 235, 119, 159),),
            
                      SizedBox(width: 10,),
            
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
            
                          crossAxisAlignment: CrossAxisAlignment.start,
            
                          children: [
            
                          
            
                   
            
                        Flexible(child: Text(snapshot.data!.docs[index]["Museum Name"],style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
            
                        SizedBox(height: 12,),
            
                        Text("Tickets Booked",style: TextStyle(color: Color(0XFF1C6A1F),fontWeight: FontWeight.w600),),
            
                    SizedBox(height: 12,),
            
                        Text(snapshot.data!.docs[index]["Date"],style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.grey),),
            
                     
            
                          ],
            
                        ),
                      ),
            
                    ],
            
                  ),
            
                ),
            
              ),
            
            ],
            
          ),
            
              );
            
            }),
        ),
  ],
);
      }),
    );
  }
}