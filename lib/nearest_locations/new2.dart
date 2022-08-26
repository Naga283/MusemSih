import 'package:flutter/material.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

class News2 extends StatefulWidget {
  const News2({Key? key}) : super(key: key);

  @override
  _News2State createState() => _News2State();
}

class _News2State extends State<News2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: WebView(initialUrl: 'https://www.ixoragroup.com/media',javascriptMode: JavascriptMode.unrestricted,)),
    );
  }
}
