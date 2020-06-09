import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class Day2App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: new ThemeData(primaryColor: Colors.blue),
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text("Flutter Study Day2"),
            leading: new IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          body: new RandomWords(),
        ));
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestion = <WordPair>[];
  final _bigFont = const TextStyle(fontSize: 18.0);

  // 存储已经点击的单词
  final _saved = <WordPair>[];

  @override
  Widget build(BuildContext context) {
    return _buildSuggestion();
  }

  Widget _buildSuggestion() {
    return new ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, position) {
          if (position.isOdd) return new Divider();

          final index = position / 2;
          if (index >= _suggestion.length) {
            _suggestion.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestion[index.floor()]);
        });
  }

  Widget _buildRow(WordPair pair) {
    // 构造ui时 ，判断是否存储过
    final _alreadySaved = _saved.contains(pair);

    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _bigFont,
      ),
      trailing: new Icon(
        _alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: _alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (_alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}
