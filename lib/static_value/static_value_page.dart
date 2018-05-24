import 'package:flutter/material.dart';
import 'static_value.dart' as staticA;
import 'package:flutter_study/static_value/static_value.dart' as staticB;

class StaticValuePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new StaticValuePageState();
  }
}

class StaticValuePageState extends State<StaticValuePage> {
  
  @override
  void initState() {
    super.initState();

    staticA.StaticValue.testStaticInt = 1;
    print('staticA: ${staticA.StaticValue.testStaticInt}    staticB:${staticB.StaticValue.testStaticInt}');

    staticB.StaticValue.testStaticInt = 2;
    print('staticA: ${staticA.StaticValue.testStaticInt}    staticB:${staticB.StaticValue.testStaticInt}');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('静态变量'),
        ),
        body: Center(
          child: Text(''),
        ));
  }
}
