import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';

class SnackBarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SnackBarPageState();
  }
}

class SnackBarPageState extends State<SnackBarPage> {
  static Widget ww = new Container(
    child: new Text('screenshot'),
  );

  GlobalKey globalKey = new GlobalKey();

  Future<void> _capturePng() async {
    // RenderRepaintBoundary boundary =
    //     globalKey.currentContext.findRenderObject();
    // ui.Image image = await boundary.toImage();
    // ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    // Uint8List pngBytes = byteData.buffer.asUint8List();
    // print(pngBytes);
    // ui.instantiateImageCodec(Uint8List(20));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('SnackBar'),
        ),
        body: new Builder(builder: (BuildContext context) {
          return new RepaintBoundary(
            key: globalKey,
            child: new Center(
              child: new GestureDetector(
                onTap: () {
                  final snackBar =
                      new SnackBar(content: new Text('这是一个SnackBar'));
                  Scaffold.of(context).showSnackBar(snackBar);
                },
                child: new Text('显示SnackBar'),
              ),
            ),
          );
        }));
  }
}
