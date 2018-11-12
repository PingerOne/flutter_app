import 'package:flutter/material.dart';

class Day4App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(primaryColor: Colors.orange),
      home: new Scaffold(
          appBar: new AppBar(title: new Text("Flutter Demo Day4")),
          body: new LayoutPage()),
    );
  }
}

class LayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Text("我是内容"),
    );
  }
}
