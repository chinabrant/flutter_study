import 'package:flutter/material.dart';

/**
 * TextStyle Demo页面
 */
class TextStylePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TextStyleState();
  }
}

class TextStyleState extends State<TextStylePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          // 去掉导航栏下面的阴影
          elevation: 0.0,
          title: new Text('TextStyle'),
        ),
        body: new Container(
          margin: EdgeInsets.all(10.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Text(
                'inherit: 为 false 的时候不显示',
                style: new TextStyle(
                  inherit: true,
                ),
              ),
              new Text(
                'color/fontSize: 字体颜色，字号等',
                style: new TextStyle(
                  color: Color(0xff00ffff),
                  // color: Color.fromARGB(255, 150, 150, 150),
                  fontSize: 22.0,
                ),
              ),
              new Text(
                'fontWeight: 字重',
                style: new TextStyle(fontWeight: FontWeight.w700),
              ),
              new Text(
                'fontStyle: FontStyle.italic 斜体',
                style: new TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
              new Text(
                'letterSpacing: 字符间距',
                style: new TextStyle(
                  letterSpacing: 10.0,
                  // wordSpacing: 15.0
                ),
              ),
              new Text(
                'wordSpacing: 字或单词间距',
                style: new TextStyle(
                    // letterSpacing: 10.0,
                    wordSpacing: 15.0),
              ),
              new Text(
                'textBaseline:这一行的值为TextBaseline.alphabetic',
                style: new TextStyle(
                    textBaseline: TextBaseline.alphabetic),
              ),
              new Text(
                'textBaseline:这一行的值为TextBaseline.ideographic',
                style: new TextStyle(
                    textBaseline: TextBaseline.ideographic),
              ),
              new Text(
                'height: 用在Text控件上的时候，会乘以fontSize做为行高,所以这个值不能设置过大',
                style: new TextStyle(
                  height: 1.0,
                )
              ),
              new Text(
                'decoration: TextDecoration.overline 上划线',
                style: new TextStyle(
                  decoration: TextDecoration.overline,
                  decorationStyle: TextDecorationStyle.wavy
                )
              ),
              new Text(
                'decoration: TextDecoration.lineThrough 删除线',
                style: new TextStyle(
                  decoration: TextDecoration.lineThrough,
                  decorationStyle: TextDecorationStyle.dashed
                )
              ),
              new Text(
                'decoration: TextDecoration.underline 下划线',
                style: new TextStyle(
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dotted
                )
              ),
            ],
          ),
        ));
  }
}
