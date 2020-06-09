import 'package:flutter/material.dart';

// Flutter动画
class Day5App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimationPageState();
  }
}

class _AnimationPageState extends State<Day5App> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  ListModel<int> _list;
  int _selectedItem;
  int _nextItem;

  @override
  void initState() {
    super.initState();

    _list = new ListModel(
        listKey: _listKey,
        removedItemBuilder: _buildRemovedItem,
        initialItems: <int>[0, 1, 2]);
    _nextItem = 3;
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: ThemeData(primaryColor: Colors.blue),
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Flutter Study Day5"),
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.add_circle),
                  onPressed: _insert,
                ),
                IconButton(icon: Icon(Icons.remove_circle), onPressed: _remove)
              ],
            ),
            body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: AnimatedList(
                    key: _listKey,
                    initialItemCount: _list.length,
                    itemBuilder: _buildItem))));
  }

  // Used to build list items that haven't been removed.
  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    return new CardItem(
      animation: animation,
      item: _list[index],
      selected: _selectedItem == _list[index],
      onTap: () {
        setState(() {
          _selectedItem = _selectedItem == _list[index] ? null : _list[index];
        });
      },
    );
  }

  // Used to build an item after it has been removed from the list. This method is
  // needed because a removed item remains  visible until its animation has
  // completed (even though it's gone as far this ListModel is concerned).
  // The widget will be used by the [AnimatedListState.removeItem] method's
  // [AnimatedListRemovedItemBuilder] parameter.
  Widget _buildRemovedItem(
      int item, BuildContext context, Animation<double> animation) {
    return new CardItem(
      animation: animation,
      item: item,
      selected: false,
      // No gesture detector here: we don't want removed items to be interactive.
    );
  }

// Insert the "next item" into the list model.
  void _insert() {
    final int index =
        _selectedItem == null ? _list.length : _list.indexOf(_selectedItem);
    _list.insert(index, _nextItem++);
  }

  // Remove the selected item from the list model.
  void _remove() {
    if (_selectedItem != null) {
      _list.removeAt(_list.indexOf(_selectedItem));
      setState(() {
        _selectedItem = null;
      });
    }
  }
}

// 数据模型
class ListModel<E> {
  ListModel(
      {@required this.listKey,
      @required this.removedItemBuilder,
      Iterable<E> initialItems})
      : assert(listKey != null),
        assert(removedItemBuilder != null),
        _items = new List<E>.from(initialItems);

  final GlobalKey<AnimatedListState> listKey;
  final dynamic removedItemBuilder;
  final List<E> _items;

  AnimatedListState get _animatedList => listKey.currentState;

  void insert(int index, E list) {
    _items.insert(index, list);
    _animatedList.insertItem(index);
  }

  E removeAt(int index) {
    final E removedItem = _items.removeAt(index);
    if (removedItem != null) {
      _animatedList.removeItem(index,
          (BuildContext context, Animation<double> animation) {
        return removedItemBuilder(removedItem, context, animation);
      });
    }
    return removedItem;
  }

  int get length => _items.length;

  E operator [](int index) => _items[index];

  int indexOf(E item) => _items.indexOf(item);
}

// item
class CardItem extends StatelessWidget {
  CardItem(
      {Key key,
      @required this.animation,
      @required this.item,
      this.onTap,
      this.selected = false})
      : assert(animation != null),
        assert(item != null && item >= 0),
        assert(selected != null),
        super(key: key);

  final Animation<double> animation;
  final VoidCallback onTap;
  final int item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;
    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
    return new Padding(
      padding: const EdgeInsets.all(2.0),
      child: new SizeTransition(
        axis: Axis.vertical,
        sizeFactor: animation,
        child: new GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: new SizedBox(
            height: 128.0,
            child: new Card(
              color: Colors.primaries[item % Colors.primaries.length],
              child: new Center(
                child: new Text('Item $item', style: textStyle),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
