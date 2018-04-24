import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {

  SecondPage({this.title});

  final String title;
  @override
  State<StatefulWidget> createState() {
    return new SecondState();
  }
}

class SecondState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          // 去掉导航栏下面的阴影
          elevation: 0.0,
          title: new Text('路由demo'),
        ),
        body:
         new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              margin: EdgeInsets.all(10.0),
              height: 44.0,
              color: Color.fromARGB(255, 255, 0, 0),
              child: new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop('这个刚才打开的页面返回的数据');
                },
                child: new Text('点击 pop 页面并返回数据给上个页面'),
              ),
            ),

            new Text('上个页面传递过来的数据为：${widget.title != null ? widget.title : ''}')
          ],
        ));
  }


}
