import 'package:flutter/material.dart';
import 'package:flutter_demo/demo/model/post.dart';

class SliverWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
//        title: Text("SliverDemoWidget"),
        pinned: true,
//        floating: true,
        expandedHeight: 160,
        flexibleSpace: FlexibleSpaceBar(
          title: Text("SliverDemoWidget"),
          centerTitle: true,
          background: Image.network(posts[8].imageUrl, fit: BoxFit.cover),
        ),
      ),
      SliverSafeArea(
          sliver: SliverPadding(
              padding: EdgeInsets.all(10), sliver: _SliverGridWidget()))
    ]));
  }
}

// 表格视图组件
class _SliverGridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          color: Colors.white,
          child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
        );
      }, childCount: posts.length),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.0),
    );
  }
}

// 列表视图组件
class _SliverListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Stack(
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.network(posts[index].imageUrl,
                          fit: BoxFit.cover),
                    )),
                Positioned(
                    left: 12,
                    bottom: 12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(posts[index].title,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text(posts[index].author,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.normal))
                      ],
                    ))
              ],
            ));
      }, childCount: posts.length),
    );
  }
}
