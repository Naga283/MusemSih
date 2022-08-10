import 'package:flutter/material.dart';
class NavBarDetails extends StatelessWidget {
  const NavBarDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Text("Logout"),
        )
      ],
    );
  }
}