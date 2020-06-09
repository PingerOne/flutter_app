import 'package:flutter/material.dart';
import 'package:flutter_app/demo/model/post.dart';

class ListViewWidget extends StatelessWidget {
  Widget _listItemBuilder(BuildContext context, int index) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
          SizedBox(height: 12.0),
          Text(posts[index].title, style: Theme.of(context).textTheme.title),
          Text(posts[index].author,
              style: Theme.of(context).textTheme.subtitle),
          SizedBox(height: 10.0)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: posts.length, itemBuilder: _listItemBuilder);
  }
}
