import 'package:flutter/material.dart';
import 'package:flutterapperadauti/events/ui/event_page/new_event_page.dart';
import 'package:flutterapperadauti/events/ui/event_page/last_event_page.dart';


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

    _tabController.addListener((){
      if (!_tabController.indexIsChanging){
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
          padding: EdgeInsets.only(bottom: 15, top: 20),
          child: Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_left, color: Color(0xFF979797),), //_left Icons.arrow_back
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width-80,
                child: new Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Icon(Icons.calendar_today, color: Color(0x55FB6340), size: 30,),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(35.0, 6.0, 0.0, 0.0), //10.0 //25.0
                            child: Text(
                              'Evenimente',
                              style: TextStyle(
                                color: Color(0xFF000000), //Color(0xFFFFFFFF),
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Material(
          color: Colors.grey.shade300,
          child: TabBar(
            unselectedLabelColor: Colors.grey,//unselectedLabelColor: Colors.blue,
            //labelColor: Colors.blue,
            indicatorColor: Color(0xAA38A49C),//indicatorColor: Colors.white,
            controller: _tabController,
            labelPadding: const EdgeInsets.all(0.0),
            tabs: [
              _getTab(
                0,
                Center(
                  child: Text(
                    'EVENIMENTE NOI',
                    style: TextStyle(
                      fontSize: 15.0,//12.0 //16.0 //14.0
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              _getTab(
                1,
                Center(
                  child: Text(
                    'EVENIMENTE TRECUTE',
                    style: TextStyle(
                      fontSize: 15.0,//12.0 //16.0 //14.0
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
              NewEvents(),
              LastEvents(),
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
              color:
              (_selectedTab == index ? Colors.white : Colors.grey.shade300),
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