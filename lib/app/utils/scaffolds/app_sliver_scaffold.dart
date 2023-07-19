import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app_drawer.dart';

class AppSliverScaffold extends StatelessWidget {
  const AppSliverScaffold({
    super.key,
    required this.appBarTitle,
    required this.slivers,
    this.showDrawerButton = true,
  });
  final String appBarTitle;
  final List<Widget> slivers;
  final bool showDrawerButton;
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
                //physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                      context,
                    ),
                  ),
                  ...slivers
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
