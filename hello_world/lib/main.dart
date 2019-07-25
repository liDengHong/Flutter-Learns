import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'hello_world',
    //   home: new Scaffold(
    //     // appBar: new AppBar(
    //     //   // title: new Text('hello', style: new TextStyle(fontSize: 12),),
    //     // ),
    //     body: new Center(
    //       child: new Text('Hello World',
    //           style: new TextStyle(
    //               fontSize: 32.0,
    //               color: Colors.red,
    //               wordSpacing: 10,
    //               fontWeight: FontWeight.w400)),
    //     ),
    //   ),
    // );
    return new Container(
      decoration: new BoxDecoration(color: Colors.black38),
      child: new Center(
        child: new Text(
          'Hello World', 
          textDirection: TextDirection.ltr,
          style: new TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
