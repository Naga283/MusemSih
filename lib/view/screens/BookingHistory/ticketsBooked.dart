// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:museum/models/appColor.dart';
import 'package:qr_flutter/qr_flutter.dart';
class TIcketsBooked extends StatefulWidget {
  final int ind;
  const TIcketsBooked({Key? key, required this.ind}) : super(key: key);

  @override
  State<TIcketsBooked> createState() => _TIcketsBookedState();
}

class _TIcketsBookedState extends State<TIcketsBooked> {
  var _key = GlobalKey();
  String a="Naga";
  var firebaseUser = FirebaseAuth.instance.currentUser;
  var firebaseCollection = FirebaseFirestore.instance.collection("Users");
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: AppColors.appBarColor,
      appBar: AppBar(title: Row(
        children: [
          Text("Ticket Booked",style: TextStyle(color: AppColors.colText),),
          const SizedBox(width: 10,),
          const Icon(FontAwesomeIcons.checkCircle,color: Colors.green,)
        ],
      ),backgroundColor: AppColors.appBarColor,),
      body: StreamBuilder(
        stream: firebaseCollection.doc(firebaseUser!.uid).collection("Tickets").snapshots(),
        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
        
return ListView.builder(
  itemCount: 1,
  itemBuilder: (context,index){
  index=widget.ind;
  return Card(
    elevation: 10,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20)
    ),
    child: Container(
      margin: const EdgeInsets.only(top: 20,bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Icon(FontAwesomeIcons.museum,size: 50,color: Color.fromARGB(255, 235, 119, 159),),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Flexible(child: Text(snapshot.data?.docs[index]["Museum Name"]??"",style: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
            ],
          ),
          SizedBox(height: 20,),
          Divider(thickness: 3,color: AppColors.appBarColor,),
          const SizedBox(height: 20),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Text(snapshot.data?.docs[index]["Name"]??"",style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
            ],
          ),
          const SizedBox(height: 6,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Age : ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.grey),),
              Text(snapshot.data?.docs[index]["Age"]??"",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.grey),),
            ],
          ),
          const SizedBox(height: 40,),
          
         
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text("Price : ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                    Text("${snapshot.data?.docs[index]["Price"].toString()}/- INR",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                  ],
                ),
            const SizedBox(height: 20,),
         
            Row(
              children: [
                const Text("Date : ",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                Text(snapshot.data?.docs[index]["Date"]??"",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
              ],
            ),
              ],
            ),
          ),
         
          const SizedBox(height: 20,),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImage(
                key: _key,
                errorStateBuilder: (cxt, err) {
    return Container(
      child: Center(
        child: Text(
          "Uh oh! Something went wrong...",
          textAlign: TextAlign.center,
        ),
      ),
    );
  },
               semanticsLabel: "data",
  data: a=="Naga"?"Booking Id :${snapshot.data?.docs[index]["id"]}\n Name: ${snapshot.data?.docs[index]["Name"]}\n Yes tickets are available":"Tickets are expired",
  version: QrVersions.auto,
  size: 150.0,
),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("BookingId : ",style: TextStyle(fontSize: 16,),),
              Text(snapshot.data?.docs[index]["id"]??"",style: const TextStyle(fontSize: 16,),),
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