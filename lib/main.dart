import 'package:flutter/material.dart';
import 'dart:async';
import './refreshindicator/refreshIndicator_demo.dart';
import './router/flutter_router.dart';
import './router_demo/second_page.dart';
import './router_demo/router_home_page.dart';
import './text_style/text_style_demo.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter实例'),
      routes: <String, WidgetBuilder> {
        // 这里可以定义静态路由，不能传递参数
        '/router/second': (_) => new SecondPage(),
        '/router/home': (_) => new RouterHomePage(),
        '/text/style': (_) => new TextStylePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 这个key用来在不是手动下拉，而是点击某个button或其它操作时，代码直接触发下拉刷新
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  List<Map<String, String>> list = <Map<String, String>>[];

  @override
  void initState() {
    super.initState();
    list.add({"title": '下拉刷新', 'type': 'pullToRefresh'});
    list.add({"title": '路由导航', 'type': 'router'});
    list.add({"title": 'TextStyle', 'type': 'ts', 'router': '/text/style'});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        // 去掉导航栏下面的阴影
        elevation: 0.0,
        title: new Text(widget.title),
      ),
      body: new ListView.builder(
        // 这句是在list里面的内容不足一屏时，list可能会滑不动，加上就一直都可以滑动
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: this.list.length,
        itemBuilder: (_, int index) => _createItem(context, list[index]),
      ),
    );
  }

  _createItem(BuildContext context, Map<String, String> map) {
    return new GestureDetector(
      onTap: () {
        if (map['type'] == 'pullToRefresh') {
          // 下拉刷新
          BRouter.pushRefreshDetail(context);
        }
        else if (map['type'] == 'router') {
          Navigator.of(context).pushNamed('/router/home');
        }
        else if (map['type'] == 'ts') {
          Navigator.of(context).pushNamed('/text/style');
        }
      },
      child: new Column(
        children: <Widget>[
          new Container(
            height: 24.0,
            margin: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            child: new Text(map['title']),
          ),
          Divider(
            height: 0.5,
          )
        ],
      ),
    );
  }
}
