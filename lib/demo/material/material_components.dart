import 'package:flutter/material.dart';
import 'checkbox_widget.dart';
import 'data_time_switch.dart';
import 'dialog_widget.dart';
import 'radio_widget.dart';
import 'slider_widget.dart';
import 'switch_widget.dart';

class MaterialComponentsDemo extends StatelessWidget {
  final List<Widget> pages = [
    SliderDemo(),
    CheckBoxDemo(),
    RadioDemo(),
    SwitchDemo(),
    DateTimeDemo(),
    DialogDemo(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('MaterialComponents')),
        body: ListView(
          children: buildListChildren(context),
        ));
  }

  List<Widget> buildListChildren(BuildContext context) {
    return List.generate(
        pages.length,
        (index) => Material(
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RoutePageDemo(
                        title: pages[index].toStringShort(),
                        body: pages[index]);
                  }));
                },
                child: Container(
                    padding: EdgeInsets.all(18),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          pages[index].toStringShort(),
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    )),
              ),
            ));
  }
}

class RoutePageDemo extends StatelessWidget {
  final String title;
  final Widget body;

  RoutePageDemo({@required this.title, @required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: body,
    );
  }
}
