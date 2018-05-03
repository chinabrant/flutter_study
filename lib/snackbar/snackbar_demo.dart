import 'package:flutter/material.dart';

class SnackBarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SnackBarPageState();
  }
}

class SnackBarPageState extends State<SnackBarPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('SnackBar'),
        ),
        body: new Builder(builder: (BuildContext context) {
          return new Center(
            child: new GestureDetector(
              onTap: () {
                final snackBar =
                    new SnackBar(content: new Text('这是一个SnackBar'));
                Scaffold.of(context).showSnackBar(snackBar);
              },
              child: new Text('显示SnackBar'),
            ),
          );
        }));
  }
}
