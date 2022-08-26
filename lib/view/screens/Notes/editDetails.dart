import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:museum/models/appColor.dart';
class EditDetails extends StatefulWidget {
  
  DocumentSnapshot docToEdit;
  EditDetails({required this.docToEdit});

  @override
  _EditDetailsState createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    title = TextEditingController(text: widget.docToEdit['title']);
    description = TextEditingController(text: widget.docToEdit['Description']);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        actions: [FlatButton(onPressed: (){

          widget.docToEdit.reference.update(
            {'title':title.text,
          'Description':description.text,
          
          }).whenComplete(() => Navigator.pop(context));
        }, child: Text("Edit",style: TextStyle(fontSize: 20,color: Colors.white),),),
        FlatButton(onPressed: (){

          widget.docToEdit.reference.delete().whenComplete(() => Navigator.pop(context));
        }, child: Text("Delete",style: TextStyle(fontSize: 20,color: Colors.white)))],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(border: Border.all()),
            child: TextField(
              controller: title,
              decoration: InputDecoration(hintText: 'Title'),
            ),),
            SizedBox(height: 10,),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(5),
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: description,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(hintText: 'Explanation'),
              ),),
            ),
        ],
      ),
    );
      
    
  }
}