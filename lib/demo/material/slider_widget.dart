import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double _sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 56,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Slider(
                value: _sliderValue,
                min: 0,
                max: 100,
                divisions: 10,
                activeColor: Theme.of(context).accentColor,
                label: "${_sliderValue.toInt()}",
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value;
                  });
                }),
            SizedBox(height: 12),
          ],
        ),
        Text('Slider Value：${_sliderValue.toInt()}'),
      ],
    );
  }
}
