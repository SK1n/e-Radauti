import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:flutterapperadauti/widgets/src/appBarModel.dart';
import 'package:flutterapperadauti/usefull_pages/about_us_app.dart';
import 'package:flutterapperadauti/usefull_pages/about_us_content.dart';
import 'package:flutterapperadauti/usefull_pages/contact.dart';

class AboutUsMain extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: NavDrawer(),
        appBar: AppBarModel().loadAppBar(
            context, 'Despre noi', Icons.add_box_outlined, _scaffoldKey),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Ionicons.ios_mail,
            color: Colors.white,
            size: 35,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Contact()),
            );
          },
        ),
        body: TabDemo(),
      ),
    );
  }
}

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
        Material(
          //color: Colors.grey.shade300,
          child: TabBar(
            unselectedLabelColor:
                Colors.grey, //unselectedLabelColor: Colors.blue,
            //labelColor: Colors.blue,
            indicatorColor: Colors.white, //indicatorColor: Color(0xAA38A49C),
            controller: _tabController,
            labelPadding: const EdgeInsets.all(0.0),
            tabs: [
              _getTab(
                0,
                Center(
                  child: Text(
                    'DESPRE NOI',
                    style: TextStyle(
                      fontSize: 15.0, //12.0 //16.0 //14.0
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              _getTab(
                1,
                Center(
                  child: Text(
                    'DESPRE APLICAȚIE',
                    style: TextStyle(
                      fontSize: 15.0, //12.0 //16.0 //14.0
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              //1
              AboutUsContent(),
              //2
              AboutUsApp(),
            ],
          ),
        ),
      ],
    );
  }

  _getTab(index, child) {
    return Tab(
      child: SizedBox.expand(
        child: Container(
          child: child,
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
