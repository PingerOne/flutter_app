import 'package:flutter/material.dart';
import 'package:flutter_app/demo/Day5.dart';
import 'package:flutter_app/demo/day1.dart';
import 'package:flutter_app/demo/day2.dart';
import 'package:flutter_app/demo/day3.dart';
import 'package:flutter_app/demo/day4.dart';

void main() => runApp(new DemoApp());

class DemoApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DemoAppAppState();
  }
}

class DemoAppAppState extends State<DemoApp> {
  var data = const [
    "Flutter Demo Day1",
    "Flutter Demo Day2",
    "Flutter Demo Day3",
    "Flutter Demo Day4",
    "Flutter Demo Day5",
  ];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(primaryColor: Colors.indigoAccent),
      home: new Scaffold(
          appBar: new AppBar(title: new Text("Flutter Demo")),
          body: new ListView.builder(
              padding: EdgeInsets.all(4.0),
              itemCount: data.length,
              itemBuilder: (context, position) {
                return ListTile(
                    leading: Icon(Icons.pages),
                    title: Text(data[position]),
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        switch (position) {
                          case 0:
                            return new Day1App();
                          case 1:
                            return new Day2App();
                          case 2:
                            return new Day3App();
                          case 3:
                            return new Day4App();
                          case 4:
                            return new Day5App();
                        }
                      }));
                    });
              })),
    );
  }
}
