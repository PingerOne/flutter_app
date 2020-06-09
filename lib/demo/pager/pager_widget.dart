import 'package:flutter/material.dart';
import 'package:flutter_app/demo/model/post.dart';

class PagerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView.builder(
        itemCount: posts.length, itemBuilder: _pageItemBuilder);
  }

  Widget _pageItemBuilder(BuildContext context, int index) {
    return PageView(
      scrollDirection: Axis.horizontal,
      reverse: false,
      pageSnapping: true,
      onPageChanged: (index) => debugPrint("选中了第$index行"),
      controller:
          PageController(initialPage: 0, keepPage: true, viewportFraction: 1.0),
      children: <Widget>[
        Stack(
          children: <Widget>[
            SizedBox.expand(
                child: Image.network(posts[index].imageUrl,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width)),
            Positioned(
                bottom: 10.0,
                left: 12.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      posts[index].title,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      posts[index].author,
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    )
                  ],
                ))
          ],
        ),
      ],
    );
  }
}
