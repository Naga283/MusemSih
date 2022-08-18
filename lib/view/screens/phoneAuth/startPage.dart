// ignore_for_file: prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import '../homeScreen.dart';
import 'NewHomeScreen.dart';

class InitialiserWidget extends StatefulWidget {
  @override
  _InitialiserWidgetState createState() => _InitialiserWidgetState();
}

class _InitialiserWidgetState extends State<InitialiserWidget> {
  late FirebaseAuth _auth;
   User? _user;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
    _user = _auth.currentUser;
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : _user == null
            ? LoginScreen()
            : HomeScreen();
  }
}
