import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class Animation01 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Animation01State();
  }

}

/**
 * Flutter的动画，说白了，就是Animation<T>对象产生一系列连续的Widget某个显示属性的中间值
 * 对应的widget的属性通过animation.value来赋值，每产生一个值就调用setState来刷新界面
 * 
 * Animation<T>对象每产生一个中间值，都是告诉它的Listener. addListener对象可以监听到
 * Animation<T>对象的值变化。animation.value就是当前值。
 * 
 * addStatusListener 可以监听animation对象的状态变化，开始，结束等等，有一个枚举定义。
 * 添加这个监听可以在动画执行完后再反向执行，等等，看自己的业务需求。
 */
class _Animation01State extends State<Animation01> with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;

  @override
    void initState() {
      super.initState();

      controller = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
      animation = Tween(begin: 0.0, end: 300.0).animate(controller)..addListener(() {
        setState(() {});
      });

      controller.forward();
    }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('动画01'),
      ),

      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          height: animation.value,
          width: animation.value,
          child: FlutterLogo(),
        ),
      ),
    );
  }

  @override
    void dispose() {
      controller.dispose();
      super.dispose();

    }
}