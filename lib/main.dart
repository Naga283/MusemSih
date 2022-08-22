// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:museum/view/screens/phoneAuth/startPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Inria"),
      debugShowCheckedModeBanner: false,
      routes: {
        '/' :(context) => InitialiserWidget(),
        // '/' :(context) => RetreiveData(),
        // '/musemDetails':(context) => MusemDetails(img: '', title: '',)
      },
      
    );
  }
}