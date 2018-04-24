import 'package:flutter/material.dart';
import './second_page.dart';

class RouterHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RouterHomeState();
  }
}

class RouterHomeState extends State<RouterHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          // 去掉导航栏下面的阴影
          elevation: 0.0,
          title: new Text('路由导航'),
        ),
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              margin: EdgeInsets.all(10.0),
              height: 44.0,
              color: Color.fromARGB(255, 255, 0, 0),
              child: new FlatButton(
                onPressed: () {
                  Navigator
                      .of(context)
                      .pushNamed('/router/second')
                      .then((value) {
                    // dialog显示返回值
                    _showDialog(context, value);
                  });
                },
                child: new Text('push 页面并接收返回值'),
              ),
            ),
            new Container(
              margin: EdgeInsets.all(10.0),
              height: 44.0,
              color: Color.fromARGB(255, 255, 0, 0),
              child: new FlatButton(
                onPressed: () {
                  Navigator
                      .of(context)
                      .push(new MaterialPageRoute(builder: (_) {
                    return new SecondPage(title: '路由是个好东西，要进一步封装');
                  }));
                },
                child: new Text('push 页面并传递参数过去'),
              ),
            ),
          ],
        ));
  }

  _showDialog(BuildContext context, String text) {
    showDialog(
        context: context,
        barrierDismissible: true,
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text('${text}'),
              new GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: new Container(
                  child: new Text('关闭'),
                ),
              )
            ],
          ),
        ));
  }
}
