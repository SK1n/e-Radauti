import 'package:flutter/material.dart';
import 'package:flutterapperadauti/air_quality/air_quality.dart';

class TabDemo extends StatefulWidget {
  @override
  _TabDemoState createState() => _TabDemoState();
}

class _TabDemoState extends State<TabDemo> with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _selectedTab = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {
          _selectedTab = _tabController.index;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 5.0),
          child: Material(
            child: TabBar(
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.white,
              controller: _tabController,
              labelPadding: const EdgeInsets.all(0.0),
              tabs: [
                _getTab(0, 'CALITATEA AERULUI',),
                _getTab(1, 'GRAFICE',),
              ],
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              AirQualityPage(),
              AirQualityPage(),
            ],
          ),
        ),
      ],
    );
  }

  _getTab(index, childString) {
    return Tab(
      child: SizedBox.expand(
        child: Container(
          child: Center(
            child: Text(
              childString,
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,),
            ),
          ),
          decoration: BoxDecoration(
              color: (_selectedTab == index ? Colors.white : Colors.white),
              borderRadius: _generateBorderRadius(index)),
        ),
      ),
    );
  }

  _generateBorderRadius(index) {
    if ((index + 1) == _selectedTab)
      return BorderRadius.only(bottomRight: Radius.circular(10.0));
    else if ((index - 1) == _selectedTab)
      return BorderRadius.only(bottomLeft: Radius.circular(10.0));
    else
      return BorderRadius.zero;
  }
}