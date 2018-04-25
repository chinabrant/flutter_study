import 'package:flutter/material.dart';
import 'dart:async';

class LoadMorePage extends StatefulWidget {
  @override
  LoadMoreState createState() => new LoadMoreState();
}

class LoadMoreState extends State<LoadMorePage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  final TrackingScrollController _scrollController =
      new TrackingScrollController();
  List<String> list = <String>[];

  // 是否有下一页
  bool isMore = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    _loadMoreData();
  }

  Future<Null> _loadMoreData() {
    return _getData();
  }

  // 请求首页数据
  Future<Null> _getData() {
    this.isLoading = true;
    final Completer<Null> completer = new Completer<Null>();

    new Timer(Duration(seconds: 2), () {
      for (int i = 0; i < 20; i++) {
        list.add('数据 ==> ${list.length}');
      }

      if (this.list.length >= 60) {
        this.isMore = false;
      } else {
        this.isMore = true;
      }

      this.isLoading = false;
      completer.complete(null);
      setState(() {});
    });

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('上拉加载更多'),
        elevation: 0.0, // 阴影高度
      ),
      body: new NotificationListener(
        onNotification: _onNotification,
        child: new ListView.builder(
          controller: _scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: itemCount(),
          itemBuilder: (_, int index) => _createItem(context, index),
        ),
      ),
    );
  }

  int itemCount() {
    if (this.list.length > 0) {
      return this.list.length + 1;
    }

    return 0;
  }

  bool _onNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      // print('max:${_scrollController.mostRecentlyUpdatedPosition.maxScrollExtent}  offset:${_scrollController.offset}');
      // 当没去到底部的时候，maxScrollExtent和offset会相等
      if (_scrollController.mostRecentlyUpdatedPosition.maxScrollExtent >
              _scrollController.offset &&
          _scrollController.mostRecentlyUpdatedPosition.maxScrollExtent -
                  _scrollController.offset <=
              50) {
        // 要加载更多
        if (this.isMore && !this.isLoading) {
          // 有下一页
          _loadMoreData();
          setState(() {});
        } else {}
      }
    }

    return true;
  }

  String _getLoadMoreString() {
    if (this.isMore && !this.isLoading) {
      return '上拉加载更多';
    } else if (!this.isMore) {
      return '没有更多了';
    } else {
      return '加载中...';
    }
  }

  _createItem(BuildContext context, int index) {
    if (index < list.length) {
      return _createArticleItem(context, index);
    }

    return new Container(
      height: 44.0,
      child: new Center(
        child: new Text(_getLoadMoreString()),
      ),
    );
  }

  _createArticleItem(BuildContext context, int index) {
    return (new Container(
      height: 44.0,
      color: Colors.white,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 15.0),
                  child: new Text('${this.list[index]}'),
                ),
              ],
            ),
          ),
          new Divider(
            height: 0.5,
          )
        ],
      ),
    ));
  }
}
