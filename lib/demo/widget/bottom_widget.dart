import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 底部导航栏组件
class BottomNavigationBarWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BottomNavigationBarState();
  }
}

// 底部导航栏状态
class BottomNavigationBarState extends State<BottomNavigationBarWidget> {
  int _index = 0;

  void _bottomTapHandler(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
        fixedColor: Colors.deepPurple,
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        onTap: _bottomTapHandler,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("搜索")),
          BottomNavigationBarItem(icon: Icon(Icons.explore), title: Text("发现")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("个人")),
        ]);
  }
}
