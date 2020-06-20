import 'package:flutter/material.dart';
import 'package:flutter_demo/study/day1.dart';
import 'package:flutter_demo/study/day2.dart';
import 'package:flutter_demo/study/day3.dart';
import 'package:flutter_demo/study/day4.dart';
import 'package:flutter_demo/study/day5.dart';
import 'package:flutter_demo/study/day6.dart';

class StudyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StudyAppState();
  }
}

class _StudyAppState extends State<StudyApp> {
  var _titles = const [
    "Flutter Study Day1",
    "Flutter Study Day2",
    "Flutter Study Day3",
    "Flutter Study Day4",
    "Flutter Study Day5",
    "Flutter Study Day6",
  ];

  var _objects = [
    new Day1App(),
    new Day2App(),
    new Day3App(),
    new Day4App(),
    new Day5App(),
    new Day6App(),
  ];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(primaryColor: Colors.indigoAccent),
      home: new Scaffold(
          appBar: new AppBar(title: new Text("Flutter Study")),
          body: new ListView.builder(
              padding: EdgeInsets.all(4.0),
              itemCount: _titles.length,
              itemBuilder: (context, position) {
                return ListTile(
                    leading: Icon(Icons.pages),
                    title: Text(_titles[position]),
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return _objects[position];
                      }));
                    });
              })),
    );
  }
}
