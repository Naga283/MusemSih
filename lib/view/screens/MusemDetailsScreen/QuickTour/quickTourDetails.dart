// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
class QuickTourDetails extends StatelessWidget {
  final String img;
  final String tit;
  const QuickTourDetails({ Key? key, required this.img, required this.tit }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:[
          Image.network(img,),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(tit,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,),),
              IconButton(onPressed: (){}, icon: Icon(Icons.play_arrow,size: 24,)),
              IconButton(onPressed: (){}, icon: Icon(Icons.share,size: 24,)),
            ],
          ),
          SizedBox(height: 30,),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
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
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/NARA.jpg"),fit: BoxFit.fill,opacity: 150.0)
            ),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text("Artist",style: TextStyle(fontSize: 30),)
              ],
            ),
          )
          

        ]
      ),
    );
  }
}