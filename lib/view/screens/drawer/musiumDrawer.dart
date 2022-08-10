import 'package:flutter/material.dart';

import '../MusemDetailsScreen/3dModel.dart';
import '../MusemDetailsScreen/Details.dart';
import '../MusemDetailsScreen/QuickTour/quickTour.dart';
import '../MusemDetailsScreen/mousePad.dart';
import '../MusemDetailsScreen/mustSee.dart';
import '../MusemDetailsScreen/visitorPolicies/visitorPolicies.dart';
import '../TicketBooking/ticketBooking.dart';
class MusiumDrawer extends StatelessWidget {
  final String ti;
  const MusiumDrawer({Key? key, required this.ti}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height:40),
          Text(ti,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          SizedBox(height: 30,),
         Divider(thickness: 3,),
         SizedBox(height: 30,),
          DetailsOfMusiumDrawer(tit: "Book Tickets", tap: (){
             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BookTickets(name: ti, price: 100,)));
          }, ic: Icon(Icons.book_online)),
          DetailsOfMusiumDrawer(tit: "Details", tap: (){
             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MonumentsDetails()));
          }, ic: Icon(Icons.add)),
          DetailsOfMusiumDrawer(tit: "Quick Tour", tap: (){
             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>QuickTour()));
          }, ic: Icon(Icons.tour)),
          DetailsOfMusiumDrawer(tit: "Model 3d", tap: (){
             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Model3dScreen()));
          }, ic: Icon(Icons.add)),
          DetailsOfMusiumDrawer(tit: "Mouse Pad", tap: (){
             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MousePad()));
          }, ic: Icon(Icons.add)),
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