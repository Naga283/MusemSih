// import 'package:flutter/material.dart';
// import 'package:bottom_navy_bar/bottom_navy_bar.dart';
// // import 'package:loocafe_android/camera.dart';
// import 'package:loocafe_android/new2.dart';
// import 'home.dart';
// import 'news.dart';

// class New extends StatefulWidget {
//   const New({Key? key}) : super(key: key);

//   @override
//   _NewState createState() => _NewState();
// }

// class _NewState extends State<New> {
//   int currentIndex = 0;
//   final List screens = [Home(), News2()];

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: screens[currentIndex],
//         bottomNavigationBar: BottomNavyBar(
//           selectedIndex: currentIndex,
//           onItemSelected: (index) {
//             setState(() {
//               currentIndex = index;
//             });
//           },
//           items: <BottomNavyBarItem>[
//             BottomNavyBarItem(
//                 icon: Icon(Icons.home),
//                 title: Text('Home'),
//                 activeColor: Colors.green.shade300,
//                 inactiveColor: Colors.black),
//             BottomNavyBarItem(
//                 icon: Icon(Icons.qr_code_scanner),
//                 title: Text('Feedback'),
//                 activeColor: Colors.green.shade300,
//                 inactiveColor: Colors.black),
//             BottomNavyBarItem(
//                 icon: Icon(Icons.newspaper),
//                 title: Text('News Feed'),
//                 activeColor: Colors.green.shade300,
//                 inactiveColor: Colors.black),
//           ],
//         ),
//       ),
//     );
//   }
// }
