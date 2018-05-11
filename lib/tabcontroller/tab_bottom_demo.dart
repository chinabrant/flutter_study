import 'package:flutter/material.dart';

class BottomTabBarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BottomTabBarState();
  }
}

class BottomTabBarState extends State<BottomTabBarPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('底部tab'),
      ),
      body: new Stack(
        children: <Widget>[
          /// Offstage 这个widget 在offstage条件为假的时候，不会显示，不会响应事件，不会占用任何的父widget的空间
          new Offstage(
            // offstage参数是一个bool类型，表示是否要显示这个widget
            offstage: _currentIndex != 0,
            child: new TickerMode(
              enabled: _currentIndex == 0,
              child: new MaterialApp(
                  home: new Center(
                child: new Text('首页'),
              )),
            ),
          ),
          new Offstage(
            offstage: _currentIndex != 1,
            child: new TickerMode(
              enabled: _currentIndex == 1,
              child: new MaterialApp(
                  home: new Center(
                child: new Text('广场'),
              )),
            ),
          ),
          new Offstage(
            offstage: _currentIndex != 2,
            child: new TickerMode(
              enabled: _currentIndex == 2,
              child: new MaterialApp(
                  home: new Center(
                child: new Text('我的'),
              )),
            ),
          ),
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: new Icon(Icons.home), title: new Text('首页')),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.crop_square), title: new Text('广场')),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.ac_unit), title: new Text('我的')),
        ],
        // 可以改变这个来设置初始的时候显示哪个tab
        currentIndex: _currentIndex,
        onTap: (int index) {
          // 这里点击tab上的item后，会执行，setState来刷新选中状态
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
