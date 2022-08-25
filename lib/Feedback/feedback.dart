import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:museum/models/appColor.dart';





class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  late final _ratingController;
  late double _rating;

  double _userRating = 3.0;
  int _ratingBarMode = 1;
  double _initialRating = 2.0;
  bool _isRTLMode = false;
  bool _isVertical = false;

  IconData? _selectedIcon;

  void initState() {
    super.initState();
    _ratingController = TextEditingController(text: '');
    _rating = _initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return
     
      Scaffold(
        backgroundColor: AppColors.appBarColor,
          appBar: AppBar(
            backgroundColor: AppColors.appBarColor,
            title: Text('Feedback'),
            
             
          ),
          body: Directionality(
            textDirection: _isRTLMode ? TextDirection.rtl : TextDirection.ltr,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 40.0,
                  ),
                  _heading('Rate Your Experience'),
                  // _ratingBar(_ratingBarMode),
                  SizedBox(height: 20,),
                  Text("How much are you satisfied with the service?",style: TextStyle(color: AppColors.colText),),
                  SizedBox(height: 20.0),
                  // _heading('How much are you satisfied with the service?'),
                  RatingBar.builder(
                    unratedColor: Colors.grey,
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    // allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Color(0XFFC6B26A),
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                    child: TextFormField(
                      
                      maxLines: 7,
                      controller: _ratingController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.colText,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color(0XFFC6B26A),
                            
                            width: 3.0
                          )
                        ),
                        labelText: 'Tell us what can be improved',
                        labelStyle: TextStyle(color: AppColors.appBarColor)
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ElevatedButton(
                    
                    style: ElevatedButton.styleFrom(
                      onSurface: Colors.red,
                      
                      onPrimary: Colors.red
                    ),
                    onPressed: () {
                      // Respond to button press
                    },
                    child: Text('Submit'),
                  )
                ],
              ),
            ),
          ),
        
    );
  }

  Widget _heading(String text) => Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 24.0,
              color: AppColors.colText
            ),
          )
        ],
      );
}