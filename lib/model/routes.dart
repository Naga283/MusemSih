import 'package:flutter/material.dart';
import 'package:museum/view/screens/MusemDetailsScreen/musemDetails.dart';
import 'package:museum/view/screens/homeScreen.dart';


class Routes{
  
   Future<dynamic> generateRoute(RouteSettings settings) async {
   switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/feed':
        return MaterialPageRoute(builder: (_) => MusemDetails(img: '', title: '',));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    } 
  }
}