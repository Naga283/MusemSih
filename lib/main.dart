import 'package:flutter/material.dart';
import 'package:museum/view/screens/MusemDetailsScreen/musemDetails.dart';
import 'package:museum/view/screens/homeScreen.dart';
void main(List<String> args) {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      routes: {
        '/' :(context) => HomeScreen(),
        // '/musemDetails':(context) => MusemDetails(img: '', title: '',)
      },
      
    );
  }
}