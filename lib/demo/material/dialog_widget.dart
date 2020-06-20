import 'package:flutter/material.dart';

enum Option { A, B, C }

class DialogDemo extends StatefulWidget {
  @override
  _DialogDemoState createState() => _DialogDemoState();
}

class _DialogDemoState extends State<DialogDemo> {
  String _choice = "Nothing";

  // 展示简单对话框
  Future _showSimpleDialog() async {
    final option = await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text('SimpleDialog'),
            children: [
              SimpleDialogOption(
                  child: Text('SimpleDialog Content A'),
                  onPressed: () {
                    Navigator.pop(context, Option.A);
                  }),
              SimpleDialogOption(
                  child: Text('SimpleDialog Content B'),
                  onPressed: () {
                    Navigator.pop(context, Option.B);
                  }),
              SimpleDialogOption(
                  child: Text('SimpleDialog Content C'),
                  onPressed: () {
                    Navigator.pop(context, Option.C);
                  }),
            ],
          );
        });

    setState(() {
      _choice = option.toString();
    });
  }

  // 展示警告对话框
  Future _showAlertDialog() async {
    final options = await showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.blue.withOpacity(0),
        builder: (context) {
          return AlertDialog(
            title: Text('AlertDialog'),
            content: Text('Are you sure about this?'),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  child: Text("SimpleDialog", style: TextStyle(fontSize: 18)),
                  onTap: _showSimpleDialog,
                ),
                SizedBox(width: 36),
                Text("Your choise is：$_choice")
              ],
            ),
            SizedBox(height: 32),
            RaisedButton(
                onPressed: _showAlertDialog, child: Text('AlertDialog')),
          ],
        ));
  }
}
