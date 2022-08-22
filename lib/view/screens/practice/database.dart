

// ignore_for_file: prefer_null_aware_operators, prefer_const_constructors

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../bottomBar.dart';


class RetreiveData extends StatefulWidget {
  const RetreiveData({ Key? key }) : super(key: key);

  @override
  State<RetreiveData> createState() => _RetreiveDataState();
}

class _RetreiveDataState extends State<RetreiveData> {
  
  final dref = FirebaseDatabase.instance.ref("Museums");
    late DatabaseReference databaseReference ;
    Map r={};
  
    
  // showData(){
  //   dref.once().then((event) {
  //     var val =event.snapshot.value as List;
  //     print(event.snapshot.value);
  //   });
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   
    databaseReference = dref;
  }
  @override
  Widget build(BuildContext context) {
  //  print(showData());
    
    return Scaffold(
     
      body: FirebaseAnimatedList(
        shrinkWrap: true,
        query: databaseReference, itemBuilder: (BuildContext context,DataSnapshot dataSnapshot,Animation animation,int index){
          var res =dataSnapshot.value as Map;
          // print(res["img"]); 
          print(res["name"]);
          // print(res.length);
          r = res;
          print("Length:"+r.length.toString());
         print("data  "+r.values.toList().toString());
         
      return DataRetrieval(r: r);
      }),
      
    );

  }
}

class DataRetrieval extends StatefulWidget {
  const DataRetrieval({
    Key? key,
    required this.r,
  }) : super(key: key);

  final Map r;

  @override
  State<DataRetrieval> createState() => _DataRetrievalState();
}

class _DataRetrievalState extends State<DataRetrieval> {
  
    bool ans = false;
  @override
  Widget build(BuildContext context) {
    
    return StreamBuilder(
    //  stream: FirebaseDatabase.instance.ref("Museums").onValue,
      builder: (context,databaseEvent){
   
       
    return ListView.builder(
      // physics: ScrollPhysics(),
                
                shrinkWrap: true,
      itemCount: 1,
      itemBuilder: (context,index) {
        return GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Bottom(img: "${widget.r["img"]}", title: "${widget.r["name"]}", data: 'European Museum details of this QrCode', lat: '${widget.r["lat"]}', lon: '${widget.r["lon"]}',)));
          },
          child: Card(
            
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              child: Container(
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.blue,
                    width: 3.0
                  )
                ),
            child: Column(
              children: [
                 Image.network("${widget.r["img"]}",
                  fit: BoxFit.cover,
                 ),
                    
                    
                Text("${widget.r["name"]}"),
              ],
            ),
          )),
        );
      }, 
      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
      
      // return Container(
      //   height: MediaQuery.of(context).size.height,
      //   width: MediaQuery.of(context).size.width,
      //   child: ListView.builder(
      //      itemCount:  widget.r.length !=0 ? widget.r.length-1:0,
      //     itemBuilder: (BuildContext context,int index) {
      //    print("adkjfa "+widget.r.length.toString());
      //     return Card(
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text("${widget.r["name"]}"),
      //          Row(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //            children: [
      //             Text("${index+1}) ",style: TextStyle(fontSize:20)),
      //              Flexible(child: Text("${widget.r[index].toString()}",style: TextStyle(fontSize:20),)),
      //          ],),
      //           Container(
      //             margin: EdgeInsets.only(left: 25),
      //             padding: EdgeInsets.only(bottom: 20,),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //               SizedBox(height: 10,),
                  
      
      //               ],
      //             ),
      //           )
      //          ,
      //          FlatButton(onPressed: (){
      //            setState(() {
                   
      //              if(ans == false){
      //                ans = true;
                     
      //                print(index+1);
      //              }
      //              else{
      //                ans = false;
      //              }
                 
      //            });
      //          }, child: Text("View Option")),
      //         //  Visibility(
      //         //    visible: ans,
      //         //    child: Text("${widget.r[index]["CORRECT OPTION "]}"))
      //         ],
      //       ),
      //     );
      //   }),
      // );
    });
  }
}