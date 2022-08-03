import 'package:flutter/material.dart';
class MonumentsDetails extends StatelessWidget {
  const MonumentsDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40,),
          Center(child: Image.asset("assets/images/NARA.jpg",height: 100,)),
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Pink Marble",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Colors.yellow),),
              IconButton(onPressed: (){}, icon: Icon(Icons.play_arrow,color: Colors.yellow,))
            ],
          ),
          Text("Mukul Ponwar",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
          SizedBox(height: 40,),
          Text("Brief Description",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 18),),
          SizedBox(height: 20,),
          Text("A marble elegsntly cut and shapped to give form to an absract geometrical composition",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text("Medium:",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Colors.yellow),),
               Text("Size:",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Colors.yellow),),
               
            ],
          ),
          Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text("Marble",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Colors.yellow),),
               Text("30 X 40 X 122",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Colors.yellow),),
               
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.3,),
          InkWell(
            onTap: (){
              showModalBottomSheet(context: context, builder: (_){
                return Container(
                  height: MediaQuery.of(context).size.height  * 0.4,
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
    );
  }
}