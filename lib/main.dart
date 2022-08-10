import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:museum/view/screens/MusemDetailsScreen/musemDetails.dart';
import 'package:museum/view/screens/homeScreen.dart';
import 'package:museum/view/screens/phoneAuth/NewHomeScreen.dart';
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
      debugShowCheckedModeBanner: false,
      routes: {
        '/' :(context) => InitialiserWidget(),
        // '/musemDetails':(context) => MusemDetails(img: '', title: '',)
      },
      
    );
  }
}