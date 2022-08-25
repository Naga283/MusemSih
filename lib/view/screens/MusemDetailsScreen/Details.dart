// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:museum/models/appColor.dart';
import 'package:museum/view/panaroma/3dScreen.dart';
import 'package:panorama/panorama.dart';
import 'package:text_to_speech/text_to_speech.dart';
class MonumentsDetails extends StatelessWidget {
  const MonumentsDetails({Key? key, required this.img, required this.tit, required this.des}) : super(key: key);
final String img;
final String tit;
final String des;

  @override
  Widget build(BuildContext context) {
    TextToSpeech tts = TextToSpeech();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Panorama3dScreen(img: img,)));
              },
              child: Center(child: Image.network(img,height: 200,))),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: Text(tit,style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Colors.yellow),)),
                IconButton(onPressed: (){
                  tts.speak(des);
                  tts.setVolume(100.0); 
                }, icon: Icon(Icons.play_arrow,color: Colors.yellow,))
              ],
            ),
            Text("Mukul Ponwar",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
            SizedBox(height: 40,),
            Text("Brief Description",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 18),),
            SizedBox(height: 20,),
            Text(des,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                 Text("Medium:",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Colors.yellow),),
                 Text("Size:",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Colors.yellow),),
                 
              ],
            ),
            Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                 Text("Marble",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Colors.yellow),),
                 Text("30 X 40 X 122",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Colors.yellow),),
                 
              ],
            ),
            
            SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
            InkWell(
              onTap: (){
                showModalBottomSheet(context: context, builder: (_){
                  return Container(
                    color: AppColors.appBarColor,
                    height: MediaQuery.of(context).size.height  * 0.4,
                    child: Image.asset("assets/images/directions/2.jpeg"),
                  );
                });
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.yellow[700],
                ),
                padding:EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width * 0.15,vertical: 10),
                child: Text("get Directions",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
              ),
            )
          ],
        ),
      ),
    );
  }
}