import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new MaterialApp(
        title: "Flutter Demo",
        theme: new ThemeData(primaryColor: Colors.orangeAccent),
        home: new RandomWords());
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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Startup Name Generator"),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushPressed)
        ],
      ),
      body: _buildSuggestion(),
    );
  }

  // 导航点击事件
  void _pushPressed() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      final tiles = _saved.map((pair) {
        return new ListTile(
            title: new Text(pair.asPascalCase, style: _bigFont));
      });

      final divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();

      return new Scaffold(
        appBar: new AppBar(title: new Text("Saved Suggestions")),
        body: new ListView(children: divided),
      );
    }));
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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
          // window in IntelliJ) to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'I just like you.',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
