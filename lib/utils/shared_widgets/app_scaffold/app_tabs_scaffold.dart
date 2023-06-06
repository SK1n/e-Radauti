import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_scaffold/app_drawer.dart';

class AppTabsScaffold extends StatelessWidget {
  const AppTabsScaffold({
    super.key,
    required this.tabs,
    required this.appBarTitle,
    this.appBar,
  });
  final PreferredSizeWidget? appBar;
  final String appBarTitle;
  final List<Map<String, dynamic>> tabs;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        endDrawer: const AppDrawer(),
        body: NestedScrollView(
          headerSliverBuilder: (
            BuildContext context,
            bool innerBoxIsScrolled,
          ) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  title: Text(appBarTitle),
                  pinned: true,
                  floating: true,
                  expandedHeight: 150.0,
                  forceElevated: innerBoxIsScrolled,
                  bottom: TabBar(
                    indicatorPadding: const EdgeInsets.all(8.0),
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: tabs.map((e) => Tab(text: e['text'])).toList(),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: tabs.map((e) {
              return SafeArea(
                top: false,
                bottom: false,
                child: Builder(
                  builder: (context) {
                    return CustomScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      key: PageStorageKey<String>(e['text']),
                      slivers: [
                        SliverOverlapInjector(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context,
                          ),
                        ),
                        e['widget'],
                      ],
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
