import 'package:flutter/material.dart';
import 'package:museum/models/appColor.dart';


class DropDownQr extends StatelessWidget {
  const DropDownQr({Key? key, }) : super(key: key);

  static const String _title = 'Select DropDown';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title),
        backgroundColor: AppColors.appBarColor,
        ),
        body: const Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'Lion Statue';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>['Lion Statue', 'Angel of Kolkata', 'The Apotheosis',]
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value,style: TextStyle(fontSize: 20),),
            );
          }).toList(),
        ),
        SizedBox(height: 30,),
        GestureDetector(
          onTap: (){
            if(dropdownValue == "Lion Statue"){

          showModalBottomSheet(context: context, builder: (_){
                  return Container(
                    color: AppColors.appBarColor,
                    height: MediaQuery.of(context).size.height  * 0.4,
                    child: Image.asset("assets/images/directions/a-b.gif"),
                  );
                });
            }
            else if(dropdownValue == "Angel of Kolkata"){

          showModalBottomSheet(context: context, builder: (_){
                  return Container(
                    color: AppColors.appBarColor,
                    height: MediaQuery.of(context).size.height  * 0.4,
                    child: Image.asset("assets/images/directions/a-c .gif"),
                  );
                });
            }
            else {

          showModalBottomSheet(context: context, builder: (_){
                  return Container(
                    color: AppColors.appBarColor,
                    height: MediaQuery.of(context).size.height  * 0.4,
                    child: Image.asset("assets/images/directions/map1nw.gif"),
                  );
                });
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
            width: MediaQuery.of(context).size.width * 0.4,
            
            decoration: BoxDecoration(
              color: AppColors.appBarColor,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Center(child: Text("Search",style: TextStyle(color: Colors.white,fontSize: 20),)),
          ),
        )
      ],
    );
  }
}
