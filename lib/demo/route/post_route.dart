import 'package:flutter/material.dart';
import 'package:flutter_demo/demo/model/post.dart';

class PostRoute extends StatelessWidget {
  final Post post;

  PostRoute({this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: Column(
        children: <Widget>[
          Image.network(post.imageUrl, fit: BoxFit.cover),
          Container(
            padding: EdgeInsets.all(32),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("${post.title}", style: Theme.of(context).textTheme.title),
                Text("${post.author}",
                    style: Theme.of(context).textTheme.subhead),
                SizedBox(height: 24),
                Text("${post.description}",
                    style: Theme.of(context).textTheme.body1),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop()),
    );
  }
}
