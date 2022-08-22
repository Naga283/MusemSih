// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:museum/view/screens/Feyechnique/feyManTechniqueFirstPage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../MusemDetailsScreen/3dModel.dart';
import '../MusemDetailsScreen/Details.dart';
import '../MusemDetailsScreen/QuickTour/quickTour.dart';
import '../MusemDetailsScreen/mousePad.dart';
import '../MusemDetailsScreen/visitorPolicies/visitorPolicies.dart';
import '../TicketBooking/ticketBooking.dart';
class MusiumDrawer extends StatelessWidget {
  final String ti;
  final String lat;
  final String lon;
  const MusiumDrawer({Key? key, required this.ti, required this.lat, required this.lon}) : super(key: key);

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
          DetailsOfMusiumDrawer(tit: "Details", tap: (){
             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MonumentsDetails()));
          }, ic: Icon(Icons.add)),
          DetailsOfMusiumDrawer(tit: "Quick Tour", tap: (){
             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>QuickTourScreen(tit: ti,)));
          }, ic: Icon(Icons.tour)),
          DetailsOfMusiumDrawer(tit: "Model 3d", tap: (){
             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Model3dScreen()));
          }, ic: Icon(Icons.add)),
          DetailsOfMusiumDrawer(tit: "Mouse Pad", tap: (){
             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MousePad()));
          }, ic: Icon(FontAwesomeIcons.airbnb)),
          DetailsOfMusiumDrawer(tit: "Notes", tap: (){
           
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> FeymanTechniqueFirstPage()));
          }, ic: Icon(FontAwesomeIcons.noteSticky)),
          DetailsOfMusiumDrawer(tit: "Directions", tap: (){
            print(lat);
            print(lon);
   launch('https://www.google.com/maps/search/?api=1&query=17.372038457504654, 78.4803726460252');
          }, ic: Icon(FontAwesomeIcons.directions)),
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