import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
class Stores extends StatelessWidget {
  final String tit;
  const Stores({Key? key, required this.tit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dataBase = FirebaseDatabase.instance.ref('Stores').child(tit);
    Map r={};
    return Scaffold(
appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Stores",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 26),)
      
      ),
       body: FirebaseAnimatedList(
        shrinkWrap: true,
        query: dataBase, itemBuilder: (BuildContext context,DataSnapshot dataSnapshot,Animation animation,int index){
          var res =dataSnapshot.value as Map; 
          r = res;
          print("readafad;fk     "+r.toString()+"daa");
          print("No");
        //  print(r.values.toList()[0]);
         
      return MousePad(r: r);
      }),
      
    
    );
  }
}
class MousePad extends StatelessWidget {
  const MousePad({ Key? key, required this.r }) : super(key: key);
final Map r;
  @override
  Widget build(BuildContext context) {
    var dref = FirebaseDatabase.instance.ref("Stores");
    return
   
   
    Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                builder: (context,snapshot) {
                  return GridView.builder(
                    itemCount: r.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(  
                        crossAxisCount: 2,  
                        crossAxisSpacing: 4.0,  
                        mainAxisSpacing: 4.0  
                    ), itemBuilder: (BuildContext context, int index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        elevation: 10,
                        child: Container(
                          margin: const EdgeInsets.only(left: 10,right: 10,top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                              // borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                                child: Image.network(r["img"],fit:BoxFit.fill)),
                              const Divider(thickness: 2.0,),
                               Flexible(child: Text(r["itemname"])),
                               Flexible(child: Text("\$ ${r["price"]}",style: TextStyle(color: Colors.red,fontSize: 20),)),
                            ],
                          ),
                        ),
                      );
                      },  
             
                  );
                }
              ),
            )
          ],
        ),
    );
    
  }
}