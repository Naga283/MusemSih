import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:museum/models/appColor.dart';
class VisitedMonuments extends StatelessWidget {
  const VisitedMonuments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    var firebaseColl = FirebaseFirestore.instance.collection("Users");
    return Scaffold(
      appBar: AppBar(
        title: Text("Visited artifacts",
      
        ),
        backgroundColor: AppColors.appBarColor,
      ),
      body: StreamBuilder(
        stream: firebaseColl.doc(firebaseUser!.uid).collection("Visited").snapshots(),
        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
        
        return ListView.builder(
          itemCount: 1,
          itemBuilder: (context,index) {
            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              margin: EdgeInsets.only(left: 10,right: 10,top: 30),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: Text(
                  "${snapshot.data?.docs[index]["name"]}",style: TextStyle(color: Colors.green,fontSize: 20),
                ),
              ),
            );
          }
        );
      }),
    );
  }
}