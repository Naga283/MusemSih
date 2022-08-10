import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:museum/models/appColor.dart';
import 'package:museum/view/screens/MusemDetailsScreen/musemDetails.dart';
import 'package:museum/view/screens/TicketBooking/ticketBooking.dart';
import 'package:museum/view/screens/bottomBar.dart';
import 'package:museum/view/screens/drawer/drawer.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   static const _kFontFam = 'MyFlutterApp';
  static const String _kFontPkg = "";
  int _counter =0;
  bool hide = false;
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldState,
     
      drawer: const Drawer(
        child: DrawerScreen()
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        
        child: Column(
          children: [
           Row(
             children: [
              IconButton(onPressed: (){
                _scaffoldState.currentState!.openDrawer()
                // FirebaseAuth.instance.signOut();
              ;}, icon: Image(
                color: AppColors.colText,
                image: const AssetImage("assets/icons/hamburger.png",))),
               Flexible(
                 child: TextField(
                  
                  decoration: InputDecoration(
                     enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
      borderSide: const BorderSide(color: Colors.grey, width: 1.5),
    ),
                    prefixIcon: const Icon(Icons.person,color: Colors.white,),
                    suffixIcon: const Icon(Icons.search,color: Colors.white,),
                    labelStyle: const TextStyle(color: Colors.white),
                    labelText: "Search Museum",
                    hintStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    
                    borderRadius: BorderRadius.circular(40))
                  ),
                 ),
               ),
               IconButton(onPressed: (){
                
               }, icon: const Icon(Icons.mic,color: Colors.white,size: 50,))
             ],
           ),
           const SizedBox(height: 60,),
//Cards View
Expanded(
  child:   GridView.count(crossAxisCount: 2,
  
  children: [
    MusemCardWidget(img: "assets/images/NARA.jpg", title: "National Musem in Delhi", clic: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Bottom(img: "assets/images/NARA.jpg", title: "National Musem in Delhi", data: 'This QR Code about the museum which is present in the National Musuem in Delhi',)))),
    MusemCardWidget(img: "assets/images/2nd.jpg", title: "National Musem in Europe", clic: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Bottom(img: "assets/images/2nd.jpg", title: "National Musem in Europe", data: 'European Museum details of this QrCode',)))),
     
           
  ],
  
  ),
)
            
          ],
        ),
      ),
  floatingActionButton: _getFAB()
    );
  }
  Widget _getFAB() {
        return SpeedDial(
           
          animatedIcon: AnimatedIcons.add_event,
          animatedIconTheme: IconThemeData(size: 22),
          backgroundColor: Color(0xFF801E48),
          visible: true,
          curve: Curves.bounceIn,
          children: [
                // FAB 1
                SpeedDialChild(
                child: Image.asset("assets/icons/whatsapp.png"),
                backgroundColor: Color(0xFF801E48),
                onTap: () { },
                label: 'Whatsapp',
                // ignore: prefer_const_constructors
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 16.0),
                labelBackgroundColor: Color(0xFF801E48)),
                // FAB 2
                SpeedDialChild(
                child: Image.asset("assets/icons/instagram.png"),
                backgroundColor: Color(0xFF801E48),
                onTap: () {
                  
                },
                label: 'Instagram',
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 16.0),
                labelBackgroundColor: Color(0xFF801E48))
          ],
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
              Text(title,style: const TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    );
  }
  
}