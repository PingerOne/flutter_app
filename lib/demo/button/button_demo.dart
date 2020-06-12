import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button Demo"),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [flatButtonWidget()],
            ),
            SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [raisedWidget()],
            ),
            SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [poponMenuWidget()],
            ),
          ],
        ),
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 80.0,
        ),
      ),
    );
  }

  Widget flatButtonWidget() {
    return FlatButton(
        onPressed: () {}, color: Colors.blue, child: Text("Save"));
  }

  Widget raisedWidget() {
    return RaisedButton(onPressed: () {}, child: Text("Save"));
  }

  Widget poponMenuWidget() {
    return PopupMenuButton(
      onSelected: (value) {
        debugPrint("popip item select value is $value");
      },
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(value: "Sace", child: Text("Save")),
        PopupMenuItem(value: "Search", child: Text("Search"))
      ],
    );
  }
}
