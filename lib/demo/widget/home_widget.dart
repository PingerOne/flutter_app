import 'package:flutter/material.dart';
import 'package:flutter_app/demo/pager/grid_widget.dart';
import 'package:flutter_app/demo/pager/pager_widget.dart';
import 'package:flutter_app/demo/sliver/sliver_widget.dart';
import 'package:flutter_app/demo/widget/bottom_widget.dart';
import 'package:flutter_app/demo/widget/drawer_widget.dart';
import 'package:flutter_app/demo/widget/listview_widget.dart';

class HomeWidget extends StatelessWidget {
  final List<Widget> _icons = [
    Tab(icon: Icon(Icons.bluetooth)),
    Tab(icon: Icon(Icons.build)),
    Tab(icon: Icon(Icons.flight)),
    Tab(icon: Icon(Icons.camera)),
  ];

  final List<Widget> _tabs = [
    ListViewWidget(),
    PagerWidget(),
    GridWidget(),
    SliverWidget()
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text("WidgetDemo"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                debugPrint("点击了搜索按钮");
              },
            )
          ],
          elevation: 0,
          bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 1.0,
              unselectedLabelColor: Colors.grey,
              tabs: _icons),
        ),
        drawer: DrawerWidget(),
        bottomNavigationBar: BottomNavigationBarWidget(),
        body: TabBarView(children: _tabs),
      ),
    );
  }
}
