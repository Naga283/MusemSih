import 'package:flutter/material.dart';
class MousePad extends StatelessWidget {
  const MousePad({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Mouse Pad",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: 5,
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
                          child: Image.asset("assets/images/NARA.jpg",fit:BoxFit.fill)),
                        const Divider(thickness: 2.0,),
                        const Flexible(child: Text("Mirrored Shadow")),
                        const Flexible(child: Text("\$ 200",style: TextStyle(color: Colors.red,fontSize: 20),)),
                      ],
                    ),
                  ),
                );
                },  
           
            ),
          )
        ],
      ),
    );
  }
}