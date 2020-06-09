import 'package:flutter/material.dart';
import 'package:flutter_app/demo/model/post.dart';

class GridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: posts.length,
        itemBuilder: _itemGridBuilder,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 160,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0));
  }

  Widget _itemGridBuilder(BuildContext context, int index) {
    return Container(
      child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
    );
  }
}
