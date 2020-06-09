import 'package:flutter/material.dart';
import 'package:flutter_app/demo/widget/home_widget.dart';

class WidgetDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.deepPurple),
        home: HomeWidget());
  }
}
