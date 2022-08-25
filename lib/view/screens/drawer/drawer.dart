// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:museum/view/screens/BookingHistory/bookingHistory.dart';
class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Image.asset("assets/images/logo.jpeg"),
          SizedBox(height: 20,),
          DetailsOfDrawer(tit: 'Booking History', tap: () {  
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BookingHistory()));
          }, ic: Icon(Icons.book),),
          DetailsOfDrawer(tit: 'Logout', tap: () { 
            setState(() {
              
            FirebaseAuth.instance.signOut();
            });
           }, ic: Icon(Icons.logout),)
        ],
      ),
    );
  }
}

class DetailsOfDrawer extends StatelessWidget {
  final String tit;
  final Icon ic;
  final VoidCallback tap;
  const DetailsOfDrawer({
    Key? key, required this.tit, required this.tap, required this.ic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Card(
        elevation: 3,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              ic,
              Text(tit,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
            ],
          ),
        ),
      ),
    );
  }
}