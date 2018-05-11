import 'package:flutter/material.dart';

class TabBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TabBarDemoState();
  }
}

class TabBarDemoState extends State<TabBarDemo>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('顶部tab切换'),
        bottom: new TabBar(
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.directions_bike),
            ),
            new Tab(
              icon: new Icon(Icons.directions_boat),
            ),
            new Tab(
              icon: new Icon(Icons.directions_bus),
            ),
          ],
          controller: _tabController,
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new Center(child: new Text('自行车')),
          new Center(child: new Text('船')),
          new Center(child: new Text('巴士')),
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return new DefaultTabController(
  //     length: 3,
  //     child: new Scaffold(
  //       appBar: new AppBar(
  //         title: new Text('顶部tab切换'),
  //         bottom: new TabBar(
  //           tabs: <Widget>[
  //             new Tab(icon: new Icon(Icons.directions_bike),),
  //             new Tab(icon: new Icon(Icons.directions_boat),),
  //             new Tab(icon: new Icon(Icons.directions_bus),),
  //           ],
  //           controller: _tabController,
  //         ),
  //       ),
  //       body: new TabBarView(
  //         children: <Widget>[
  //           new Center(child: new Text('自行车')),
  //           new Center(child: new Text('船')),
  //           new Center(child: new Text('巴士')),
  //         ],
  //       ),
  //     ),
  //   );
  // }

}
