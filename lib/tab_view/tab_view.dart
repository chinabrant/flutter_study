import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class TabData {
  String get tabTitle;
}

class TabItem extends TabData {
  final String title;
  TabItem({this.title});

  @override
  String get tabTitle => title;
}

class TabView extends StatefulWidget {
  // 高度
  final double height;
  // tab 数据
  final List<TabData> items;
  // 两个tab之间的间隔
  final double tabGap;

  final EdgeInsets margin;
  final EdgeInsets padding;
  final int initIndex;

  TabView(
      {@required this.items,
      this.height = 44.0,
      this.tabGap = 15.0,
      this.margin,
      this.padding,
      this.initIndex = 0});

  @override
  State<StatefulWidget> createState() {
    return _TabViewState();
  }
}

class _TabViewState extends State<TabView> {
  // 保存tab的widget key
  List<GlobalKey> _tabKeys = List<GlobalKey>();
  //
  int currentIndex;
  GlobalKey _indicatorKey = GlobalKey();
  double _indicatorLeft = 0.0;
  double _indicatorWidth = 0.0;
  double _indicatorTop = 0.0;

  @override
  void initState() {
    currentIndex = widget.initIndex;
    super.initState();
  }

  @override
  void didUpdateWidget(TabView oldWidget) {
    super.didUpdateWidget(oldWidget);

    updateIndicator();
  }

  void updateIndicator() {
    GlobalKey key = _tabKeys[currentIndex];
    double indicatorTop = _getWidgetSize(key).height - 2.0;
    double indicatorLeft = _getWidgetLocation(key).dx;
    double indicatorWidth = _getWidgetSize(key).width;

    if (_indicatorLeft == indicatorLeft && _indicatorTop == indicatorTop && indicatorWidth == _indicatorWidth) {
      return;
    } else {
      _indicatorLeft = indicatorLeft;
      _indicatorTop = indicatorTop;
      _indicatorWidth = indicatorWidth;
    }
  }

  @override
  Widget build(BuildContext context) {
    // 清空所有的key
    _tabKeys.clear();

    return Container(
      margin: widget.margin,
      padding: widget.padding,
      height: widget.height,
      color: Colors.grey,
      child: Stack(
        children: <Widget>[
          Container(
            height: widget.height,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _createTabs(),
            ),
          ),
          _createIndicator(),
        ],
      ),
    );
  }

  Widget _createIndicator() {
    return Positioned(
      key: _indicatorKey,
      top: _indicatorTop,
      left: _indicatorLeft,
      width: _indicatorWidth,
      height: 2.0,
      child: Container(
        color: Colors.red,
      ),
    );
  }

  List<Widget> _createTabs() {
    return widget.items.map((tabData) => _createTabItem(tabData)).toList();
  }

  Widget _createTabItem(TabItem item) {
    GlobalKey key = GlobalKey();
    _tabKeys.add(key);

    return Container(
      key: key,
      margin: EdgeInsets.only(right: widget.tabGap),
      child: Text(item.tabTitle),
    );
  }

  Offset _getWidgetLocation(GlobalKey key) {
    RenderBox renderBox = key.currentContext.findRenderObject();
    var offset = renderBox.localToGlobal(Offset.zero);
    return offset;
  }

  Size _getWidgetSize(GlobalKey key) {
    RenderBox renderBox = key.currentContext.findRenderObject();

    return renderBox.size;
  }
}
