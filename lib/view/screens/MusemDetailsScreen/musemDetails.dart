// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:museum/view/screens/MusemDetailsScreen/3dModel.dart';
import 'package:museum/view/screens/MusemDetailsScreen/mousePad.dart';
import 'package:museum/view/screens/MusemDetailsScreen/mustSee.dart';
import 'package:museum/view/screens/MusemDetailsScreen/QuickTour/quickTour.dart';
import 'package:museum/view/screens/MusemDetailsScreen/visitorPolicies/visitorPolicies.dart';
import 'package:text_to_speech/text_to_speech.dart';


import '../../../models/appColor.dart';
import '../../textTOSpeech/texttoSpeech.dart';
import '../TicketBooking/ticketBooking.dart';
import '../drawer/musiumDrawer.dart';
import 'Details.dart';
class MusemDetails extends StatefulWidget {
  
  final String img;
  final String title;
  final String lat;
  final String lon;
  const MusemDetails({ Key? key, required this.img, required this.title, required this.lat, required this.lon }) : super(key: key);

  @override
  State<MusemDetails> createState() => _MusemDetailsState();
}

class _MusemDetailsState extends State<MusemDetails> {
  @override
  Widget build(BuildContext context) {
     GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
    
      
    List<String> images =[
      widget.img,widget.img,widget.img,widget.img
    ];
    var dataBase = FirebaseDatabase.instance.ref("MustSee").child(widget.title);
    var dataBaseEvent = FirebaseDatabase.instance.ref("Events").child(widget.title);
    Map r={};
    Map rEvent = {};
   
    return Scaffold(
      key: _scaffoldkey,
      endDrawer: Drawer(
        child: MusiumDrawer(ti: widget.title, lat: widget.lat, lon: widget.lon,),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      
            Stack(
              // alignment: Alignment.bottomCenter,
              children: [
                
                  ClipRRect(
                    
                  borderRadius:  BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                  child: Image.network(widget.img,
         
                  
                  )),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    child: SafeArea(child: IconButton(onPressed: (){
                _scaffoldkey.currentState!.openEndDrawer()
                // FirebaseAuth.instance.signOut();
              ;}, icon: Image(
                color: AppColors.colText,
                image: AssetImage("assets/icons/menu.png",))),))),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.17,
                    bottom:0,
                    child: Text(widget.title,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 24),))
                ],
            ),
        SizedBox(height: 40,),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Must-See",style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)),
                      TextButton(onPressed: (){
                         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MustSeeScreen(tit: widget.title,)));
                      }, child: Text("Click here"))
                    ],
                  ),
            Text("Perfect for the first time visitors.Explore the museum throughtime collection and curated tours."),
            SizedBox(height: 40,),
          // 
          FirebaseAnimatedList(
        shrinkWrap: true,
        query: dataBase, itemBuilder: (BuildContext context,DataSnapshot dataSnapshot,Animation animation,int index){
          var res =dataSnapshot.value as Map; 
          r = res;
        //  print(r);
         
      return  MustSeeMusiumScreen( r: r,);
      }),

           SizedBox(height: 20,),
           Text("Events & Exhibition",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),),
           Text("ongoing"),
           SizedBox(height: 10,),
           //Events DataBase
            FirebaseAnimatedList(
        shrinkWrap: true,
        query: dataBaseEvent, itemBuilder: (BuildContext context,DataSnapshot dataSnapshot,Animation animation,int index){
          var res =dataSnapshot.value as Map; 
          rEvent = res;
        //  print(r);
         
           
      return EventsWidget(widget: widget, rE: rEvent,);
      }),
              
            GestureDetector(
  onTap: (){
    

    // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TextToSpeechWidget()));
  },
  child: Text("Speech")),
            
                ],
              ),
            ),
           
           
      
          ],
        ),
      ),
  
    );
  }
}

class EventsWidget extends StatelessWidget {
  const EventsWidget({
    Key? key,
    required this.widget, required this.rE,
    
  }) : super(key: key);

  final MusemDetails widget;
  final Map rE;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: StreamBuilder(
        builder: (context,snapshot) {
          return !snapshot.hasData?ListView.builder(
            itemCount: rE.length>3?3:rE.length,
             scrollDirection: Axis.horizontal,
            itemBuilder: (context,index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(rE["img"],height: 130,width: 230,
                  fit: BoxFit.fill,)));
            }
          ):Center(
            child: Text("No data"),
          );
        }
      ),
    );
  }
}

class MustSeeMusiumScreen extends StatelessWidget {
  final Map r;
  const MustSeeMusiumScreen({
    Key? key,
     required this.r,
  }) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return Container(
     height: 100,
      child: StreamBuilder(
        builder: (context,snapshot) {
          return ListView.builder(
            physics: ClampingScrollPhysics(),
           itemCount: r.length,
           scrollDirection: Axis.horizontal,
            itemBuilder: (context,index) {
              return Container(
                margin: EdgeInsets.only(left: 10),
                child: Image.network(r["img"],height: 100,));
            }
          );
        }
      ),
    );
  }
}