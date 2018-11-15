import 'package:flutter/material.dart';

// Flutter动画
class Day5App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text("Flutter Day5"),
            leading: new IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          body: new AnimationPage()),
    );
  }
}

class AnimationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimationPageState();
  }
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Text("页面中心");
  }
}
