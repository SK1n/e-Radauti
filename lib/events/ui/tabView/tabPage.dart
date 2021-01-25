import 'package:flutter/material.dart';
import 'package:flutterapperadauti/events/ui/event_page/new_event_page.dart';
import 'package:flutterapperadauti/events/ui/event_page/last_event_page.dart';

class TabDemo extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldState;
  TabDemo({Key key, this.scaffoldState,}) : super(key: key);

  @override
  _TabDemoState createState() => _TabDemoState(scaffoldState,);
}

class _TabDemoState extends State<TabDemo> with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _selectedTab = 0;
  final GlobalKey<ScaffoldState> scaffoldState;

  _TabDemoState(this.scaffoldState,);

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
                _getTab(0, 'EVENIMENTE NOI',),
                _getTab(1, 'EVENIMENTE TRECUTE',),
              ],
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              NewEvents(),
              LastEvents(),
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
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
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
