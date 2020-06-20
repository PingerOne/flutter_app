import 'package:flutter/material.dart';

class CheckBoxDemo extends StatefulWidget {
  @override
  _CheckBoxDemoState createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends State<CheckBoxDemo> {
  bool isCheck = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Checkbox(
                value: isCheck,
                onChanged: (value) {
                  setState(() {
                    isCheck = value;
                  });
                }),
            SizedBox(height: 32),
            CheckboxListTile(
                value: isCheck,
                title: Text('CheckBox Title'),
                subtitle: Text('Description'),
                secondary: Icon(Icons.book),
                selected: isCheck,
                onChanged: (value) {
                  setState(() {
                    isCheck = value;
                  });
                })
          ],
        ));
  }
}
