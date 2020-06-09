import 'package:flutter/material.dart';

class Day6App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.deepOrange),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Study Day6"),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Center(
          child: RaisedButton(
            child: Text("页面跳转"),
            textColor: Colors.black,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return NewRouterPage();
              }));
            },
          ),
        ),
      ),
    );
  }
}

class NewRouterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("新的页面"),
      ),
      body: Center(
        child: Text("这是一个新的页面"),
      ),
    );
  }
}
