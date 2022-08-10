import 'package:flutter/material.dart';
import 'package:museum/models/appColor.dart';
class VisitorPolicies extends StatelessWidget {
  
  const VisitorPolicies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var styleText = TextStyle(
      fontSize: 18,fontWeight: FontWeight.bold
    );
    var space = SizedBox(height: 10,);
    return Scaffold(appBar: AppBar(title: Text("Visitor Policies",style: TextStyle(color: AppColors.colText),),
    backgroundColor: AppColors.appBarColor,
    ),
    body: Container(
      margin: EdgeInsets.only(left: 10,right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30,),
          Text("1. Healthy environment to all visitors, NGMA, New Delhi has taken the following steps while suggesting and arranging materials to the visitors for there use.",style: styleText,textAlign: TextAlign.justify,),
          space,
          Text("2. Wash hands and use hand sanitizer regularly during your visit.",style: styleText,),
          space,
          Text("3. Face coverings are required for all visitors, even if you are vaccinated",style: styleText,),
          space,
          Text("4. Maintain physical distancing. Keep atleast six feet from others",style: styleText,),
          space,
          Text("5. Report symptoms of illness",style: styleText,),
          space,
          Text("6. Do not touch the art",style: styleText,)
        ],
      ),
    ),
    );
    
  }
}