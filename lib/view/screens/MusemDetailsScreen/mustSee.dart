import 'package:flutter/material.dart';
class MustSeeScreen extends StatelessWidget {
  const MustSeeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Must See",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 26),)
      
      ),
      body: Column(
        children: [
          Card(
            color: Colors.black,
            child: Row(
              children: [
                Image.asset("assets/images/NARA.jpg",height: 100,),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("ABHIMANUE BADH",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Artist:",style: TextStyle(color: Colors.white),),
                          Text("Artist:",style: TextStyle(color: Colors.white),),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}