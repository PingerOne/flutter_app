import 'package:flutter/material.dart';
import 'package:flutter_app/demo/form/form_widget.dart';
import 'package:flutter_app/demo/route/post_route.dart';

class WidgetDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      initialRoute: "/",
      routes: {
//        "/": (context) => HomeWidget(),
        "/": (context) => FormWidget(),
        "/post_route": (context) =>
            PostRoute(post: ModalRoute
                .of(context)
                .settings
                .arguments),
//        "/form": (context) => FormWidget(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.deepPurple),
//        home: HomeWidget()
    );
  }
}
