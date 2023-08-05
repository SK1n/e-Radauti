import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
import 'app_drawer.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.appBarTitle,
    required this.slivers,
    this.scrollPhysics,
    this.showDrawerButton = true,
    this.actions,
  });
  final String appBarTitle;
  final List<Widget> slivers;
  final bool showDrawerButton;
  final ScrollPhysics? scrollPhysics;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: showDrawerButton ? const AppDrawer() : null,
      body: NestedScrollView(
        headerSliverBuilder: (
          BuildContext context,
          bool innerBoxIsScrolled,
        ) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                title: Text(appBarTitle),
                centerTitle: true,
                forceElevated: innerBoxIsScrolled,
                actions: actions,
              ),
            ),
          ];
        },
        body: SafeArea(
          top: false,
          bottom: false,
          child: Builder(
            builder: (context) {
              return CustomScrollView(
                physics: scrollPhysics,
                slivers: [
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                      context,
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => Padding(
                          padding: AppConstants.smallInnerCardPadding,
                          child: slivers[index]),
                      childCount: slivers.length,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
