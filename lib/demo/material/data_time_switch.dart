import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:async/async.dart';

class DateTimeDemo extends StatefulWidget {
  @override
  _DateTimeDemoState createState() => _DateTimeDemoState();
}

class _DateTimeDemoState extends State<DateTimeDemo> {
  DateTime dateTime = DateTime.now();

  void _showDateTime() async {
    DateTime newDateTime = await showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));

    if (newDateTime == null) {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('you cancle your choise.')));
      return;
    }

    setState(() {
      dateTime = newDateTime;
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('select your timer success.')));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => _showDateTime(),
            child: Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(DateFormat.yMd().format(dateTime)),
                    SizedBox(width: 6),
                    Icon(Icons.arrow_drop_down)
                  ],
                )),
          )
        ],
      ),
    );
  }
}
