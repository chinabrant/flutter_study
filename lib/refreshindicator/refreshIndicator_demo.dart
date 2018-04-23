import 'package:flutter/material.dart';
import 'dart:async';

class RefreshIndicatorDemo extends StatefulWidget {
  RefreshIndicatorDemo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<RefreshIndicatorDemo> {
  // 这个key用来在不是手动下拉，而是点击某个button或其它操作时，代码直接触发下拉刷新
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  List<String> list = <String>[];

  @override
  void initState() {
    super.initState();

    list.add('下拉添加新数据');
  }

  Future<Null> _getData() {
    final Completer<Null> completer = new Completer<Null>();

    // 启动一下 [Timer] 在3秒后，在list里面添加一条数据，关完成这个刷新
    new Timer(Duration(seconds: 3), () {
      // 添加数据，更新界面
      setState(() {
        list.add("新加数据${list.length}");
      });

      // 完成刷新
      completer.complete(null);
    });

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        // 去掉导航栏下面的阴影
        elevation: 0.0,
        title: new Text('下拉刷新'),
        actions: <Widget>[
          new GestureDetector(
              onTap: () {
                // 点击按钮开始下拉刷新
                _refreshIndicatorKey.currentState.show();
              },
              child: new Container(
                alignment: Alignment.center,
                child: new Text('点击下拉')
              )
                
          )
        ],
      ),
      body: new RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _getData, // onRefresh 参数是一个 Future<Null> 的回调
        child: new ListView.builder(
          // 这句是在list里面的内容不足一屏时，list可能会滑不动，加上就一直都可以滑动
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: this.list.length,
          itemBuilder: (_, int index) => _createItem(list[index]),
        ),
      ),
    );
  }

  _createItem(String title) {
    return new Column(
      children: <Widget>[
        new Container(
          height: 24.0,
          margin: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          child: new Text(title),
        ),
        Divider(
          height: 0.5,
        )
      ],
    );
  }
}
