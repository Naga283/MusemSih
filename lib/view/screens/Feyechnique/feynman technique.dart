import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'editDetails.dart';

class FeyManTechnique extends StatelessWidget {
  var firebaseUser= FirebaseAuth.instance.currentUser;
 // CollectionReference ref  = ;
  List<Color> myColors = [
    Colors.red.shade200,Colors.yellow.shade200,Colors.green.shade200,Colors.deepPurple.shade200,Colors.orange.shade200
    ,Colors.pinkAccent.shade200
  ];
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
    
    body: StreamBuilder(
      stream: FirebaseFirestore.instance.collection("Users").doc(firebaseUser!.uid).collection("Notes").snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        return ListView.builder(
          padding: EdgeInsets.all(10),
          
         
         
        itemCount: snapshot.hasData?snapshot.data!.docs.length:0,
         itemBuilder:(_,index){
           Random random = Random();
           Color bg = myColors[random.nextInt(6)];
           return Card(
             margin: EdgeInsets.only(top:20),
            
             color: bg,
             child: Padding(

               padding: const EdgeInsets.all(20.0),
               child: Column(
                 children: [
                  
                   
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(""),
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.white30),
                        child: PopupMenuButton(
          icon: Icon(Icons.more_vert,color: Colors.white), // add this line
          itemBuilder: (_) => <PopupMenuItem<String>>[
            new PopupMenuItem<String>(
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditDetails(docToEdit: snapshot.data!.docs[index])));
                },
                child: Container(
                    width: 100,
                    // height: 30,
                    child: Text(
                        "Edit",
                        style: TextStyle(color: Colors.black),
                    )),
              )),

          ],
          // onSelected: (index) async {
          //   switch (index) {
          //     case 'edit':
            
                  
          //       break;
          //   }
          // }
          ),
                      )
                     ],
                   ),
                   Container(child: Text(snapshot.data!.docs[index]["title"],style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
                   SizedBox(height: 10,),
                   Text(snapshot.data!.docs[index]["Description"],style: TextStyle(fontSize: 16),),
                 ],
               ),
             ),
           );
         } );
      }
    ),
      
    );
  }
}