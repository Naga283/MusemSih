import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:museum/models/appColor.dart';
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
      appBar: AppBar(title: Text("Booking history",style: TextStyle(color: AppColors.colText),),backgroundColor: AppColors.appBarColor,),
      body: StreamBuilder(
        stream: firebaseCollection.doc(firebaseUser!.uid).collection("Tickets").snapshots(),
        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
        
return ListView.builder(
  itemCount: snapshot.hasData?snapshot.data!.docs.length:0,
  itemBuilder: (context,index){
  
  return Card(
    elevation: 10,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20)
    ),
    child: Container(
      margin: EdgeInsets.only(left: 10,top: 20,bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Ticket ${index+1}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ],
          ),
          Divider(thickness: 3,),
          SizedBox(height: 10),
          Row(
            children: [
              Text("BookingId : ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
              Text(snapshot.data!.docs[index]["id"],style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
            ],
          ),
          Row(
            children: [
              Text("Musium Name : ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
              Text(snapshot.data!.docs[index]["Museum Name"],style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
            ],
          ),
          Row(
            children: [
              Text("Ticket Price : ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
              Text(snapshot.data!.docs[index]["Price"].toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
            ],
          ),
          Row(
            children: [
              Text("Name : ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
              Text(snapshot.data!.docs[index]["Name"],style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
            ],
          ),
          Row(
            children: [
              Text("Age : ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
              Text(snapshot.data!.docs[index]["Age"],style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
            ],
          ),
         
          Row(
            children: [
              Text("Date : ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
              Text(snapshot.data!.docs[index]["Date"],style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
            ],
          ),
        ],
      ),
    ),
  );
});
      }),
    );
  }
}