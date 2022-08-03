import 'package:flutter/material.dart';
import 'package:museum/view/screens/MusemDetailsScreen/musemDetails.dart';
import 'package:museum/view/screens/TicketBooking/ticketBooking.dart';
import 'package:museum/view/screens/bottomBar.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      drawer: Drawer(),
      backgroundColor: Colors.black,
      body: SafeArea(
        
        child: Column(
          children: [
           Row(
             children: [
               Flexible(
                 child: TextField(
                  
                  decoration: InputDecoration(
                     enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
      borderSide: const BorderSide(color: Colors.grey, width: 1.5),
    ),
                    prefixIcon: Icon(Icons.person,color: Colors.white,),
                    suffixIcon: Icon(Icons.search,color: Colors.white,),
                    labelStyle: TextStyle(color: Colors.white),
                    labelText: "Search Museum",
                    hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    
                    borderRadius: BorderRadius.circular(40))
                  ),
                 ),
               ),
               IconButton(onPressed: (){
                
               }, icon: Icon(Icons.mic,color: Colors.white,size: 50,))
             ],
           ),
           SizedBox(height: 60,),
//Cards View
Expanded(
  child:   GridView.count(crossAxisCount: 2,
  
  children: [
    MusemCardWidget(img: "assets/images/NARA.jpg", title: "National Musem in Delhi", clic: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Bottom(img: "assets/images/NARA.jpg", title: "National Musem in Delhi", data: 'This QR Code about the museum which is present in the National Musuem in Delhi',)))),
    MusemCardWidget(img: "assets/images/2nd.jpg", title: "National Musem in Europe", clic: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Bottom(img: "assets/images/2nd.jpg", title: "National Musem in Europe", data: 'European Museum details of this QrCode',)))),
  ],
  
  ),
)

            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BookTickets()));
        },child: Icon(Icons.add),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white,width:2.0),
        borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class MusemCardWidget extends StatelessWidget {
  final VoidCallback clic;
  final String img;
  final String title;
  const MusemCardWidget({
    Key? key, required this.clic, required this.img, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: clic,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.blue,
              width: 3.0
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(img,
              
              fit: BoxFit.cover,),
              Text(title,style: TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    );
  }
}