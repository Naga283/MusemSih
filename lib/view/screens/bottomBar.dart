import 'package:flutter/material.dart';
import 'package:museum/view/screens/MusemDetailsScreen/musemDetails.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Bottom extends StatefulWidget {
  final String img;
  final String title;
  final String data;
  const Bottom({ Key? key, required this.img, required this.title, required this.data,}) : super(key: key);
 
  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  
  var _selectedTab = _SelectedTab.home;
  var _currentIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
   List<Widget> _widgetOptions = <Widget>[
    MusemDetails(img: widget.img, title: widget.title),
      SafeArea(
        child: Column(
          children: [
            QrImage(
            data: widget.data,
            version: QrVersions.auto,
            size: 320,
            gapless: false,
            errorStateBuilder: (cxt, err) {
              return Container(
            child: Center(
              child: Text(
                "Uh oh! Something went wrong...",
                textAlign: TextAlign.center,
              ),
            ),
              );
            },
      ),
      Text("Scan the above QR Code to Get the details of the Museum")
          ],
        ),
      ),
    Text("Collection")
  ];
   
    return Scaffold(
      body: _widgetOptions.elementAt(_currentIndex),
      bottomNavigationBar: bottomNavi(),
    );
  }
  SalomonBottomBar bottomNavi() {
   
//_widgetOptions.elementAt(_selectedIndex),
    return SalomonBottomBar(
              
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.info),
            title: Text("Info"),
            selectedColor: Colors.purple,
          ),

          /// Likes
          // SalomonBottomBarItem(
          //   icon: Icon(Icons.favorite_border),
          //   title: Text("Likes"),
          //   selectedColor: Colors.pink,
          // ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(Icons.qr_code),
            title: Text("Qr_Code"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.collections),
            title: Text("Collections"),
            selectedColor: Colors.teal,
          ),
        ],
      );
  }
  
}
enum _SelectedTab { home, favorite, search, person }