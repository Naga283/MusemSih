import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:museum/models/appColor.dart';
class VisitedMuseums extends StatelessWidget {
  const VisitedMuseums({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var firebaseCollection = FirebaseFirestore.instance.collection("Users");
    
    var firebaseUser = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        title: Text("Visited musems"),
      ),
      body: StreamBuilder(
         stream: firebaseCollection.doc(firebaseUser!.uid).collection("Tickets").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
        return Container(
          child: ListView.builder(
            itemCount: snapshot.hasData?snapshot.data!.docs.length:0,itemBuilder: ((context, index) {
            return  Card(
              
              child: Column(
                children: [
                  Text(snapshot.data!.docs[index]["Museum Name"],style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Text("Visited",style: TextStyle(color: Colors.red),)
                  // Text("Visited", style: TextStyle(color: Colors.red),)
                ],
              ));
          })),
        );
       },

      ),
    );
  }
}