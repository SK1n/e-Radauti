import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_scaffold/app_drawer.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final String appBarTitle;
  const AppScaffold(
      {super.key, required this.body, this.appBar, this.appBarTitle = ''});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      endDrawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          appBarTitle,
          style: const TextStyle(color: Colors.blue),
        ),
        automaticallyImplyLeading: true,
        foregroundColor: Colors.black,
        actions: [
          InkWell(
            child: const Icon(Icons.menu),
            onTap: () => scaffoldKey.currentState!.openEndDrawer(),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CustomScrollView(
            slivers: [
              body,
            ],
          ),
        ),
      ),
    );
  }
}
