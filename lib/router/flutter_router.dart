import 'package:flutter/material.dart';
import 'package:flutter_study/refreshindicator/refreshIndicator_demo.dart';

class BRouter {
  static void pushRefreshDetail(BuildContext context) {

    Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
            (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
          return new RefreshIndicatorDemo();
        }, transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          // 添加一个平移动画
          return BRouter.createTransition(animation, child);
        }));
  }

  /// 创建一个平移变换
  /// 跳转过去查看源代码，可以看到有各种各样定义好的变换
  static SlideTransition createTransition(
      Animation<double> animation, Widget child) {
    return new SlideTransition(
      position: new Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: const Offset(0.0, 0.0),
      ).animate(animation),
      child: child, // child is the value returned by pageBuilder
    );
  }
}
