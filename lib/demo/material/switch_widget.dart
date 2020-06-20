import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget {
  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool isSwitchOpen = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
          Row(
            children: [
              Text('设置'),
              SizedBox(height: 18),
              Switch(
                  value: isSwitchOpen,
                  onChanged: (value) {
                    setState(() {
                      this.isSwitchOpen = value;
                    });
                  })
            ],
          ),
          SwitchListTile(
              value: isSwitchOpen,
              title: Text('Switch Title A'),
              subtitle: Text('Swtich Subtitle A'),
              selected: isSwitchOpen,
              onChanged: (value) {
                setState(() {
                  this.isSwitchOpen = value;
                });
              })
        ],
      ),
    );
  }
}
