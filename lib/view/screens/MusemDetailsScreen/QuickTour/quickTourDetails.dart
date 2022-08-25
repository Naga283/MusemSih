// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:text_to_speech/text_to_speech.dart';
class QuickTourDetails extends StatelessWidget {
  final String img;
  final String tit;
  final String artist;
  final String des;
  final String loc;
  const QuickTourDetails({ Key? key, required this.img, required this.tit, required this.artist, required this.des, required this.loc }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextToSpeech tts = TextToSpeech(); 
    String text = "Hello, Good Morning!"; 
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children:[
              Image.network(img,height: 300,),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(child: Text(tit,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),)),
                  IconButton(onPressed: (){
                    tts.speak(des);
tts.setVolume(100.0); 
                  }, icon: Icon(Icons.play_arrow,size: 24,)),
                  IconButton(onPressed: (){
                    tts.pause();

                  }, icon: Icon(Icons.pause,size: 24,)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.share,size: 24,)),
                ],
              ),
              SizedBox(height: 30,),
              //
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    //  Container(
                    //   height: 200,
                    //   child: PageView()),
                    Text("Info",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
                    Text("Description",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
                    Text("About Artist",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
                  
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Container(
                height: MediaQuery.of(context).size.height* 0.433,
                width: MediaQuery.of(context).size.width,
                // decoration: BoxDecoration(
                //   image: DecorationImage(image: NetworkImage(img),opacity: 220.0)
                // ),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    // Text("Artist",style: TextStyle(fontSize: 30),),

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Flexible(child: Text(des,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),textAlign: TextAlign.justify,))),
Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    Column(
      children: [
        Text("- Artist",style: TextStyle(fontWeight: FontWeight.bold),),
        Text(artist,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      ],
    )
  ],
)
                  ],
                ),
              ),
              
        SizedBox(height: 20,),
            ]
          ),
        ),
      ),
    );
  }
}