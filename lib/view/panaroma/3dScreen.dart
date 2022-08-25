import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';
class Panorama3dScreen extends StatelessWidget {
  const Panorama3dScreen({Key? key, required this.img}) : super(key: key);
final String img;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
        child: Panorama(
          child: Image.network(img),
        ),
      ),
    );
  }
}