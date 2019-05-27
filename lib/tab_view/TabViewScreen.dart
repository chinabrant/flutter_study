import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_study/tab_view/tab_view.dart';

class TabViewScreen extends StatelessWidget {
  List<TabData> items = [
    TabItem(title: '两字'),
    TabItem(title: '三个字'),
    TabItem(title: '四个字的'),
    TabItem(title: '这是五个字')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CustomTabView'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TabView(
              padding: const EdgeInsets.only(left: 20.0),
              items: items,
            ),
            
          ],
        ),
      ),
    );
  }
}
