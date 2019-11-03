import 'package:flutter/material.dart';
class ErrorScreen extends StatefulWidget {
  @override
  _ErrorScreenState createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Column(
      children: <Widget>[
        Container(child: Text("ErrorScreen"),),
        RaisedButton(onPressed: (){},child: Text("Open Settings"),),
      ],
    )));
  }
}
