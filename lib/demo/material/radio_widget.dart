import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  int groupValue = 0;

  void _handleRadioChange(value) {
    setState(() {
      groupValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Radio(
                value: 0,
                groupValue: groupValue,
                onChanged: _handleRadioChange),
            Radio(
                value: 1,
                groupValue: groupValue,
                onChanged: _handleRadioChange),
          ],
        ),
        SizedBox(height: 32),
        RadioListTile(
            value: 0,
            groupValue: groupValue,
            title: Text('Radio Group A'),
            subtitle: Text('Radio Description A'),
            secondary: Icon(Icons.filter_1),
            selected: groupValue == 0,
            onChanged: _handleRadioChange),
        RadioListTile(
            value: 1,
            groupValue: groupValue,
            title: Text('Radio Group B'),
            subtitle: Text('Radio Description B'),
            secondary: Icon(Icons.filter_1),
            selected: groupValue == 1,
            onChanged: _handleRadioChange),
      ],
    );
  }
}
