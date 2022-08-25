// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:museum/models/appColor.dart';
import 'package:museum/view/screens/Notes/NotesDetails.dart';


import 'addDetails.dart';

class NotesFirstPage extends StatelessWidget {
  const NotesFirstPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: AppColors.appBarColor,
      appBar: AppBar(title: Text('Notes',style: TextStyle(fontWeight: FontWeight.bold),),
       
       backgroundColor: AppColors.appBarColor,
       elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          SizedBox(height: 100,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NotesDetails()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                color: Colors.white
                ),
                child: Text("View Notes",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),),
            ),
            SizedBox(height: 60,),
            GestureDetector(
              onTap: (){
               
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddDetails(uid: '',)));
   
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                color: Colors.white
                ),
                child: Text("Add Notes",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),)),
            ),
              ],
            )
          ],
        ),
      ),
    );
  }
}