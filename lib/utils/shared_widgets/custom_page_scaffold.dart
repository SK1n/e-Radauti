import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/const.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';
import 'package:get/get.dart';
class CustomPageScaffold extends StatelessWidget {
  final List<Widget> slivers;
  final String navBarMiddle;
  final Widget? navBarTrailing;
  final Widget? navBarLeading;
  final PreferredSizeWidget? bottom;
  const CustomPageScaffold({
    super.key,
    required this.slivers,
    this.navBarMiddle = '',
    this.navBarTrailing,
    this.navBarLeading,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      endDrawer: const NavDrawer(),
      appBar: AppBar(
        leading: navBarLeading,
        title: Text(navBarMiddle),
        actions: [navBarTrailing ??
            InkWell(
              onTap: () => Get.toNamed(Routes.account),
              child: const Icon(
                CupertinoIcons.profile_circled,
              ),
            ),]
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: leftMargin,
            right: rightMargin,
            top: topMargin,
          ),
          child: CustomScrollView(
            slivers: slivers,
          ),
        ),
      ),
    );
  }
}
