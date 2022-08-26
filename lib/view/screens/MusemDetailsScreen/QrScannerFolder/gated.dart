import 'package:flutter/material.dart';
import 'package:museum/models/appColor.dart';


// class ShowPlaylist extends StatefulWidget {
//   const ShowPlaylist({Key? key}) : super(key: key);

//   static const String _title = 'Select Your Places';

//   @override
//   State<ShowPlaylist> createState() => _ShowPlaylistState();
// }

// class _ShowPlaylistState extends State<ShowPlaylist> {
//   @override
//   Widget build(BuildContext context) {
//     int val=1;
//     int res=0;
//     int val2 =2;
//     bool isChecked =true;
//     int val3=3;
//     return MaterialApp(
//       title: ShowPlaylist._title,
//       home: Scaffold(
//         appBar: AppBar(title: const Text(ShowPlaylist._title),
//         backgroundColor: AppColors.appBarColor
//         ),
//         body: Column(
//           children: [
//             MyStatefulWidget(na: 'Double statue of Mephistopheles & Margaretta', d: val,),
//             MyStatefulWidget(na: 'Veiled Rebecca', d: val2,),
//             MyStatefulWidget(na: 'Marble Baby', d: val3,),
            
//             GestureDetector(
//               onTap: (){
//                 res = res+val;
//                 showModalBottomSheet(context: context, builder: (_){
//                   return Container(
//                     color: AppColors.appBarColor,
//                     height: MediaQuery.of(context).size.height  * 0.4,
//                     child: res ==7?Image.asset("assets/images/directions/map1nw.gif"):Image.asset("assets/images/logo.jpeg"),
//                   );
//                 });
//               },
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
//                 decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadius.circular(20)
//                 ),
//                 child: Text("Search Direction",style: TextStyle(color: AppColors.colText),),
//               ),
//             ),
//             Checkbox(value: isChecked, onChanged: (bool? val){
//                 setState(() {
//                   isChecked = val!;
//                 });
//             })
//           ],
//         ),
//       ),
//     );
//   }
// }

class GateWidget extends StatefulWidget {

  const GateWidget({Key? key, required this.na, required this.d, }) : super(key: key);
  final String na;
  final int d;

  

  @override
  State<GateWidget> createState() => _GateWidgetState();
}

class _GateWidgetState extends State<GateWidget> {
  bool isChecked = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  int val = 0;
  int val1=0;
  int val2=0;
  int res=0;


  @override
  Widget build(BuildContext context) {
    // res = res+val;
    print(val);
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return
     Scaffold(
      appBar: AppBar(title: Text("Select arts"),
      backgroundColor: AppColors.appBarColor,
      ),
       body: Column(
         children: [
          SizedBox(height: 20,),
           Row(
            children: [
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                    if(value==true){
     
                    val = 1;
                    // res =res+widget.d;
                    }
                    else{
                      val =0;
                      res=0;
                    }
                  });
                },
              ),
              
              Flexible(child: Text("Double statue of Mephistopheles & Margeretta"  ,style: TextStyle(fontSize: 20),)),
            ],
             ),
           Row(
            children: [
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isChecked2,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked2 = value!;
                    if(value==true){
     
                    val1 = 2;
                    // res =res+widget.d;
                    }
                    else{
                      val1 =0;
                      res=0;
                    }
                  });
                },
              ),
              
              Text("Veiled Rebecca",style: TextStyle(fontSize: 20),),
            ],
             ),
           Row(
            children: [
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isChecked3,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked3 = value!;
                    if(value==true){
     
                    val2 = 5;
                    // res =res+widget.d;
                    }
                    else{
                      val2 =0;
                      res=0;
                    }
                  });
                },
              ),
              
              Text("Marble Baby",style: TextStyle(fontSize: 20),),
            ],
             ),
             GestureDetector(
              onTap: (){
                res = res+val+val1+val2;
                if(res == 0){
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Not selected"),duration: Duration(milliseconds: 300),));
 
                }
                else if(res == 1){
                   showModalBottomSheet(context: context, builder: (_){
                  return Container(
                    color: AppColors.appBarColor,
                    height: MediaQuery.of(context).size.height  * 0.4,
                    child: Image.asset("assets/images/directions/1.gif"),
                  );
                }).whenComplete(() {
                  setState(() {
                    res =0;
                  });
                });
                }
                else if(res == 2){
                   showModalBottomSheet(context: context, builder: (_){
                  return Container(
                    color: AppColors.appBarColor,
                    height: MediaQuery.of(context).size.height  * 0.4,
                    child: Image.asset("assets/images/directions/2.gif"),
                  );
                }).whenComplete(() {
                  setState(() {
                    res =0;
                  });
                });
                }
                else if(res == 3){
                   showModalBottomSheet(context: context, builder: (_){
                  return Container(
                    color: AppColors.appBarColor,
                    height: MediaQuery.of(context).size.height  * 0.4,
                    child: Image.asset("assets/images/directions/1-2.gif"),
                  );
                }).whenComplete(() {
                  setState(() {
                    res =0;
                  });
                });
                }
                else if(res == 5){
                   showModalBottomSheet(context: context, builder: (_){
                  return Container(
                    color: AppColors.appBarColor,
                    height: MediaQuery.of(context).size.height  * 0.4,
                    child: Image.asset("assets/images/directions/3.gif"),
                  );
                }).whenComplete(() {
                  setState(() {
                    res =0;
                  });
                });
                }
                else if(res == 6){
                   showModalBottomSheet(context: context, builder: (_){
                  return Container(
                    color: AppColors.appBarColor,
                    height: MediaQuery.of(context).size.height  * 0.4,
                    child: Image.asset("assets/images/directions/1-3.gif"),
                  );
                }).whenComplete(() {
                  setState(() {
                    res =0;
                  });
                });
                }
                else if(res == 7){
                   showModalBottomSheet(context: context, builder: (_){
                  return Container(
                    color: AppColors.appBarColor,
                    height: MediaQuery.of(context).size.height  * 0.4,
                    child: Image.asset("assets/images/directions/2-3.gif"),
                  );
                }).whenComplete(() {
                  setState(() {
                    res =0;
                  });
                });
                }
                else{
                  showModalBottomSheet(context: context, builder: (_){
                  return Container(
                    color: AppColors.appBarColor,
                    height: MediaQuery.of(context).size.height  * 0.4,
                    child: Image.asset("assets/images/directions/1-2-3.gif"),
                  );
                });
                }
                
                // showModalBottomSheet(context: context, builder: (_){
                //   return Container(
                //     color: AppColors.appBarColor,
                //     height: MediaQuery.of(context).size.height  * 0.4,
                //     child: to ==7?Image.asset("assets/images/directions/map1nw.gif"):Image.asset("assets/images/logo.jpeg"),
                //   );
                // });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Text("Search Direction",style: TextStyle(color: AppColors.colText),),
              ),
            ),
         ],
       ),
     );
  }
}
