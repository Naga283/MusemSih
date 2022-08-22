// ignore_for_file: prefer_const_constructors

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:museum/view/screens/MusemDetailsScreen/QuickTour/quickTourDetails.dart';
class QuickTourScreen extends StatefulWidget {
  final String tit;
  const QuickTourScreen({ Key? key, required this.tit }) : super(key: key);

  @override
  State<QuickTourScreen> createState() => _QuickTourScreenState();
}

class _QuickTourScreenState extends State<QuickTourScreen> {
 
  
  // final dref = FirebaseDatabase.instance.ref();
  //   late DatabaseReference databaseReference ;
    
  
    
  // showData(){
  //   dref.once().then((event) {
  //     var val =event.snapshot.value as List;
  //     print("List "+val.toString());
  //   });
  // }
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
   
  //   databaseReference = dref;
  // }
  @override
  Widget build(BuildContext context) {
   var dataBase = FirebaseDatabase.instance.ref("QuickTour").child(widget.tit);
    Map r={};
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Quick Tour",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 26),)
      
      ),
      body: FirebaseAnimatedList(
        shrinkWrap: true,
        query: dataBase, itemBuilder: (BuildContext context,DataSnapshot dataSnapshot,Animation animation,int index){
          var res =dataSnapshot.value as Map; 
          r = res;
          print("readafad;fk     "+r.toString()+"daa");
          print("No");
        //  print(r.values.toList()[0]);
         
      return QuickTour(r: r);
      }),
      
    );

  }
}
class QuickTour extends StatelessWidget {
  final Map r;
  const QuickTour({ Key? key, required this.r }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
        child: StreamBuilder(
          builder: (context,snapshot) {
            return ListView.builder(
              itemCount: r.length,
              itemBuilder: (BuildContext context, int index) {  
            return GestureDetector(
              onTap: (() => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>QuickTourDetails(img: r["img"], tit: r["aname"], artist: r['artist'], des: r['desc'], loc: r['location'],)))),
              child: Card(
                // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  color: Colors.black,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.network(r["img"],height: 100,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Column(
                        
                        children: [
                          Text(r["aname"],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                        ],
                      ),
                              Text("Artist",style: TextStyle(color: Colors.white),),
                              Text("Location:",style: TextStyle(color: Colors.white),),
                              Text("Description",style: TextStyle(color: Colors.white),),
                            ],
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(r["artist"],style: TextStyle(color: Colors.white),),
                              Text(r["location"],style: TextStyle(color: Colors.white),),
                              // Text(r["desc"],style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            );}
            );
          }
        ),
      );
   
  }
}