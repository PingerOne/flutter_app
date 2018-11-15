import 'package:flutter/material.dart';

// 构建Flutter静态页面
class Day3App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(primaryColor: Colors.teal),
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text("Flutter Demo Day3"),
            leading: new IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          body: new LayoutPage()),
    );
  }
}

class LayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        new Image.asset("images/girl_01.jpg", fit: BoxFit.fitWidth),
        new TitleSection(),
        new ButtonSection(),
        new TextSection()
      ],
    );
  }
}

class TitleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(16.0),
      child: new Row(children: <Widget>[
        new Expanded(
            child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text("我是主标题，别羡慕",
                style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
            new Container(
              padding: EdgeInsets.only(top: 4.0),
              child: new Text("我是子标题，羡慕个屁",
                  style: new TextStyle(color: Colors.grey)),
            )
          ],
        )),
        new Icon(Icons.star, color: Colors.pink),
        new Container(
          padding: EdgeInsets.only(left: 8.0),
          child: new Text("41"),
        )
      ]),
    );
  }
}

class ButtonSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(16.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildColumn(context, Icons.call, "电话"),
          buildColumn(context, Icons.near_me, "附近"),
          buildColumn(context, Icons.share, "分享")
        ],
      ),
    );
  }

  Column buildColumn(BuildContext context, IconData icon, String label) {
    return new Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Icon(icon, color: Theme.of(context).primaryColor),
        new Text(
          label,
          style: new TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).primaryColor),
        )
      ],
    );
  }
}

class TextSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String text =
        "Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.";
    return new Container(
      padding: EdgeInsets.all(16.0),
      child: new Text(text, softWrap: true),
    );
  }
}
