import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class NewsFeed extends StatefulWidget {
  const NewsFeed({Key? key}) : super(key: key);

  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text('News feed'),centerTitle: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: size.width*0.95,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.grey.withAlpha(40)
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: size.width*0.9,
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.0)),image: DecorationImage(fit: BoxFit.fill,
                    image: AssetImage('assets/loo.jpg')
                  ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(image: AssetImage('assets/loo.jpg')),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text('Data',style: TextStyle(fontSize: 18),),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
