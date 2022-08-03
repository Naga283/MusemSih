import 'package:flutter/material.dart';
import 'package:museum/view/screens/MusemDetailsScreen/QuickTour/quickTourDetails.dart';
class QuickTour extends StatelessWidget {
  const QuickTour({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Quick Tour"),),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {  
              return GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>QuickTourDetails()));
                },
                child: GestureDetector(
                  onTap: (() => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>QuickTourDetails()))),
                  child: Card(
                      color: Colors.black,
                      child: Row(
                        children: [
                          Image.asset("assets/images/NARA.jpg",height: 100,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Buffalo",style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.bold,fontSize: 20),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text("Artist",style: TextStyle(color: Colors.white),),
                                    Text("Ramkinkar Bail",style: TextStyle(color: Colors.white),)
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text("Location:",style: TextStyle(color: Colors.white),),
                                    Text("japiur House",style: TextStyle(color: Colors.white),)
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text("Floor",style: TextStyle(color: Colors.white),),
                                    Text("Ground Floor",style: TextStyle(color: Colors.white),)
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                ),
              );}
              ),
            )
          ],
        ),
      ),
    );
  }
}