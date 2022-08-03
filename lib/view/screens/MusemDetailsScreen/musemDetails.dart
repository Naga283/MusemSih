import 'package:flutter/material.dart';
import 'package:museum/view/screens/MusemDetailsScreen/3dModel.dart';
import 'package:museum/view/screens/MusemDetailsScreen/mousePad.dart';
import 'package:museum/view/screens/MusemDetailsScreen/mustSee.dart';
import 'package:museum/view/screens/MusemDetailsScreen/QuickTour/quickTour.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'Details.dart';
class MusemDetails extends StatelessWidget {
  final String img;
  final String title;
  const MusemDetails({ Key? key, required this.img, required this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> images =[
      img,img,img,img
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                
                  ClipRRect(
                    
                  borderRadius:  BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                  child: Image.asset(img,
         
                  
                  )),
                  Text(title,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 24),)
                ],
            ),
        SizedBox(height: 40,),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Must-See",style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)),
            Text("Perfect for the first time visitors.Explore the museum throughtime collection and curated tours."),
            SizedBox(height: 40,),
           SingleChildScrollView(
            scrollDirection: Axis.horizontal,
             child: Row(
              children: [
                Image.asset(img,height: 100,),
                SizedBox(width: 20,),
                Image.asset(img,height:100),
                 SizedBox(width: 20,),
                Image.asset(img,height: 100,)
              ],
             ),
           ),
           SizedBox(height: 20,),
           Text("Events & Exhibition",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),),
           Text("ongoing"),
           SizedBox(height: 10,),
            SingleChildScrollView(
            scrollDirection: Axis.horizontal,
             child: Row(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(img,height: 130,width: 230,
                    fit: BoxFit.fill,))),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(img,height: 130,width: 230,
                    fit: BoxFit.fill,))),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(img,height: 130,width: 230,
                    fit: BoxFit.fill,))),
                
              ],
             ),
           ),
              
             MaterialButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MustSeeScreen()));
             }, child: Text("MustSee")),
             MaterialButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MonumentsDetails()));
             },child: Text("Details"),),
             MaterialButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>QuickTour()));
             },child: Text("Quick Tour"),),
             MaterialButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Model3dScreen()));
             },child: Text("Model 3d Screen"),),
             MaterialButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MousePad()));
             },child: Text("Mouse Pad"),),
            
                ],
              ),
            ),
           
           
      
          ],
        ),
      ),
      
    );
  }
}