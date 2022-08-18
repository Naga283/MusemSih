// ignore_for_file: prefer_const_constructors

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';



import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MustSeeScreen extends StatefulWidget {
  final String tit;
  const MustSeeScreen({ Key? key, required this.tit }) : super(key: key);

  @override
  State<MustSeeScreen> createState() => _MustSeeScreenState();
}

class _MustSeeScreenState extends State<MustSeeScreen> {
  var val;
  
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
   var dataBase = FirebaseDatabase.instance.ref("MustSee").child(widget.tit);
    Map r={};
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Must See",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 26),)
      
      ),
      body: FirebaseAnimatedList(
        shrinkWrap: true,
        query: dataBase, itemBuilder: (BuildContext context,DataSnapshot dataSnapshot,Animation animation,int index){
          var res =dataSnapshot.value as Map; 
          r = res;
          print("readafad;fk     "+r.toString()+"daa");
          print("No");
        //  print(r.values.toList()[0]);
         
      return DataMustScreen(r: r);
      }),
      
    );

  }
}
class DataMustScreen extends StatefulWidget {
  final Map r;
  const DataMustScreen({ Key? key, required this.r }) : super(key: key);

  @override
  State<DataMustScreen> createState() => _DataMustScreenState();
}

class _DataMustScreenState extends State<DataMustScreen> {

   
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
         
        builder: (context,databaseEvent) {
         
          return Container(
            height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount:  widget.r.length,
              itemBuilder: (context,index) {
                return Card(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(widget.r["aname"],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                        ],
                      ),
                      Row(
                        children: [
                          Image.network("${widget.r["img"]}",height: 100,width: 150,),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    // Text("${widget.r["aname"]}",style: const TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                                    Text("Artist:",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                                    SizedBox(height: 20,),
                                    Text("Location:",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                                    SizedBox(height: 20,),
                                    // Text("Location:",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    // Text("${widget.r["aname"]}",style: const TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                                    Text("${widget.r["artist"]}",style: TextStyle(color: Colors.white,fontSize: 18),overflow: TextOverflow.ellipsis,),
                                    SizedBox(height: 20,),
                                    Text("${widget.r["location"]}",style: TextStyle(color: Colors.white,fontSize: 18),),
                                    SizedBox(height: 20,),
                                    // Text("${widget.r["desc"]}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              }
            ),
          );
        }
      )
    ;
  }
}