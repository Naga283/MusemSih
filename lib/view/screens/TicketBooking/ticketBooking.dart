

import 'package:flutter/material.dart';
class BookTickets extends StatelessWidget {
  const BookTickets({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.orange[300],
      appBar: AppBar(
      backgroundColor: Colors.black,
        title: Text("Book Tickets"),
      ),
      body: Column(
        children: [
          Card(
            color: Colors.white,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // ignore: prefer_const_constructors
                  TicketTextFields(tit: 'Name:',),
                  SizedBox(height: 20,),
                  TicketTextFields(tit: 'Age:',),
                  SizedBox(height: 20,),
                  TicketTextFields(tit: 'Date:',),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(right: 20),
                child: ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.add,), label: Text("Add"),)),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        onPressed: (){},
      backgroundColor: Colors.black,
      label: Text("Book Tickets"),
      ),
    );
  }
}

class TicketTextFields extends StatelessWidget {
  final String tit;
  const TicketTextFields({
    Key? key, required this.tit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return TextField(
      onTap: (){
        // DatePickerDialog(initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.now());
        showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.now());
      },
      // ignore: prefer_const_constructors
      decoration: InputDecoration(
        fillColor: Colors.grey,
        border: InputBorder.none,
        filled: true,
        
        hintText: tit),
    );
  }
}