import 'package:flutter/material.dart';
import 'package:flutter_study/tab_view/TabViewScreen.dart';
import 'dart:async';
import './refreshindicator/refreshIndicator_demo.dart';
import './router/flutter_router.dart';
import './router_demo/second_page.dart';
import './router_demo/router_home_page.dart';
import './text_style/text_style_demo.dart';
import './load_more/load_more_demo.dart';
import './list/list_view_demo.dart';
import './theme/theme_demo.dart';
import './snackbar/snackbar_demo.dart';
import './tabcontroller/tab_controller_demo.dart';
import './tabcontroller/tab_bottom_demo.dart';
import './static_value/static_value_page.dart';
import './animation/animation01.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter实例'),
      routes: <String, WidgetBuilder> {
        // 这里可以定义静态路由，不能传递参数
        '/router/second': (_) => new SecondPage(),
        '/router/home': (_) => new RouterHomePage(),
        '/text/style': (_) => new TextStylePage(),
        '/load/more': (_) => new LoadMorePage(),
        '/list/index': (_) => new ListViewPage(),
        '/theme/index': (_) => new ThemeDemo(),
        '/snackbar/index': (_) => new SnackBarPage(),
        '/tabbar/index': (_) => new TabBarDemo(),
        '/tabbar/bottom': (_) => new BottomTabBarPage(),
        '/staticvalue': (_) => new StaticValuePage(),
        '/animation01': (_) => Animation01(),
        '/tab/custom': (_) => TabViewScreen(),
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
    list.add({"title": '自定义tab view', 'type': 'customtab', 'router': '/tab/custom'});
    list.add({"title": '下拉刷新',      'type': 'pullToRefresh'});
    list.add({"title": '路由导航',      'type': 'router'});
    list.add({"title": 'TextStyle',    'type': 'ts',        'router': '/text/style'});
    list.add({"title": '上拉加载更多',    'type': 'lm',       'router': '/load/more'});
    list.add({"title": 'ListView',      'type': 'list',     'router': '/list/index'});
    list.add({"title": '使用主题',        'type': 'theme',    'router': '/theme/index'});
    list.add({"title": 'SnackBar',      'type': 'snackbar', 'router': '/snackbar/index'});
    list.add({"title": '顶部tab切换',     'type': 'tabbar',   'router': '/tabbar/index'});
    list.add({"title": '底部tab切换',     'type': 'tabbarb', 'router': '/tabbar/bottom'});
    list.add({"title": '静态变量bug',     'type': 'staticvalue', 'router': '/staticvalue'});
    list.add({"title": '动画01',     'type': 'animation01', 'router': '/animation01'});
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
        else {
          Navigator.of(context).pushNamed(map['router']);
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


