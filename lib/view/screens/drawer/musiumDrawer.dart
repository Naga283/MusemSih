// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:museum/Feedback/feedback.dart';
import 'package:museum/view/panaroma/new.dart';
import 'package:museum/view/panaroma/visitedMonuments.dart';

import 'package:museum/view/screens/Notes/FirstPageNotes.dart';
import 'package:url_launcher/url_launcher.dart';
import '../MusemDetailsScreen/QuickTour/quickTour.dart';
import '../MusemDetailsScreen/mousePad.dart';
import '../MusemDetailsScreen/visitorPolicies/visitorPolicies.dart';
import '../TicketBooking/ticketBooking.dart';
class MusiumDrawer extends StatelessWidget {
  final String ti;
  final String lat;
  final String lon;
  final String ima;
  const MusiumDrawer({Key? key, required this.ti, required this.lat, required this.lon, required this.ima}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height:40),
          Icon(FontAwesomeIcons.museum,size: 100,),
          SizedBox(height: 20,),
          Text(ti,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
         Divider(thickness: 3,),
         SizedBox(height: 30,),
          DetailsOfMusiumDrawer(tit: "Book Tickets", tap: (){
             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BookTickets(name: ti, price: 100,)));
          }, ic: Icon(Icons.book_online)),
         
          DetailsOfMusiumDrawer(tit: "Quick Tour", tap: (){
             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>QuickTourScreen(tit: ti,)));
          }, ic: Icon(Icons.tour)),
         
          DetailsOfMusiumDrawer(tit: "Feedback", tap: (){
             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FeedbackPage(title: ti)));
          }, ic: Icon(FontAwesomeIcons.edit)),
          DetailsOfMusiumDrawer(tit: "Store", tap: (){
             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Stores(tit: ti,)));
          }, ic: Icon(FontAwesomeIcons.store)),
          DetailsOfMusiumDrawer(tit: "Notes", tap: (){
           
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NotesFirstPage()));
          }, ic: Icon(FontAwesomeIcons.noteSticky)),
          DetailsOfMusiumDrawer(tit: "Directions", tap: (){
            print(lat);
            print(lon);
   launch('https://www.google.com/maps/search/?api=1&query=$lat, $lon');
          }, ic: Icon(FontAwesomeIcons.directions)),
          DetailsOfMusiumDrawer(tit: "Musium 3d", tap: (){
           Navigator.of(context).push(MaterialPageRoute(builder: (context)=> New(img: ima,)));
   
          }, ic: Icon(FontAwesomeIcons.unity)),
          DetailsOfMusiumDrawer(tit: "Visited Monuments", tap: (){
           Navigator.of(context).push(MaterialPageRoute(builder: (context)=> VisitedMonuments()));
   
          }, ic: Icon(Icons.near_me)),
          DetailsOfMusiumDrawer(tit: "Visitor Policies", tap: (){
             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>VisitorPolicies()));
          }, ic: Icon(Icons.policy)),
        ],
      ),
    );
  }
}
class DetailsOfMusiumDrawer extends StatelessWidget {
  final String tit;
  final Icon ic;
  final VoidCallback tap;
  const DetailsOfMusiumDrawer({
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
              Text(tit,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    );
  }
}