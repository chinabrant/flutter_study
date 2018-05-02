import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  ListViewPageState createState() => new ListViewPageState();
}

class ListViewPageState extends State<ListViewPage> {
  List<String> list = <String>[];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 20; i++) {
      list.add('数据 ==> ${i}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ListView'),
        elevation: 0.0, // 阴影高度
      ),
      body: new ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: this.list.length,
        itemBuilder: (_, int index) => _createItem(context, index),
      ),
    );
  }

  _createItem(BuildContext context, int index) {
    return (new Container(
      height: 44.0,
      color: Colors.white,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 15.0),
                  child: new Text('${this.list[index]}'),
                ),
              ],
            ),
          ),
          new Divider(
            height: 0.5,
          )
        ],
      ),
    ));
  }
}
