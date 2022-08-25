import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AddDetails extends StatelessWidget {
   final String uid;
  AddDetails({
    required this.uid,
  });
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  var firebaseUser = FirebaseAuth.instance.currentUser;

  CollectionReference ref =FirebaseFirestore.instance.collection("Users");
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        backgroundColor: Color(0xff167885),
        actions: [FlatButton(onPressed: (){
          ref.doc(firebaseUser!.uid).collection("Notes").add({'title':title.text,
          'Description':description.text,
          
          }).whenComplete(() => Navigator.pop(context));
        }, child: Text("Save",style: TextStyle(fontSize: 20,color: Colors.white)))],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(border: Border.all()),
            child: TextField(
              controller: title,
              decoration: InputDecoration(hintText: 'Title',),
            ),),
            SizedBox(height: 10,),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(5),
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: description,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(hintText: 'Explanation'),
              ),),
            ),
        ],
      ),
    );
  }
}
