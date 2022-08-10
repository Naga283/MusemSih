import 'package:flutter/material.dart';
import 'package:museum/view/screens/MusemDetailsScreen/3dModel.dart';
import 'package:museum/view/screens/MusemDetailsScreen/mousePad.dart';
import 'package:museum/view/screens/MusemDetailsScreen/mustSee.dart';
import 'package:museum/view/screens/MusemDetailsScreen/QuickTour/quickTour.dart';
import 'package:museum/view/screens/MusemDetailsScreen/visitorPolicies/visitorPolicies.dart';


import '../../../models/appColor.dart';
import '../TicketBooking/ticketBooking.dart';
import '../drawer/musiumDrawer.dart';
import 'Details.dart';
class MusemDetails extends StatelessWidget {
  
  final String img;
  final String title;
  const MusemDetails({ Key? key, required this.img, required this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
    List<String> images =[
      img,img,img,img
    ];
    return Scaffold(
      key: _scaffoldkey,
      endDrawer: Drawer(
        child: MusiumDrawer(ti: title,),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      
            Stack(
              // alignment: Alignment.bottomCenter,
              children: [
                
                  ClipRRect(
                    
                  borderRadius:  BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                  child: Image.asset(img,
         
                  
                  )),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    child: SafeArea(child: IconButton(onPressed: (){
                _scaffoldkey.currentState!.openEndDrawer()
                // FirebaseAuth.instance.signOut();
              ;}, icon: Image(
                color: AppColors.colText,
                image: AssetImage("assets/icons/menu.png",))),))),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.17,
                    bottom:0,
                    child: Text(title,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 24),))
                ],
            ),
        SizedBox(height: 40,),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Must-See",style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)),
                      TextButton(onPressed: (){
                         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MustSeeScreen()));
                      }, child: Text("Click here"))
                    ],
                  ),
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
              
            
            
                ],
              ),
            ),
           
           
      
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.black,
        
      //   onPressed: (){
      //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BookTickets()));
      //   },child: Icon(Icons.add),
      // shape: RoundedRectangleBorder(
      //   side: BorderSide(color: Colors.white,width:2.0),
      //   borderRadius: BorderRadius.circular(10)),
      // ),
    );
  }
}