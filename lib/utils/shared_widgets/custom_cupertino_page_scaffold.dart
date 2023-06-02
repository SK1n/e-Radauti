import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/const.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class CustomCupertinoPageScaffold extends StatelessWidget {
  final List<Widget> slivers;
  final String navBarMiddle;
  final Widget? navBarTrailing;
  final Widget? navBarLeading;
  const CustomCupertinoPageScaffold({
    super.key,
    required this.slivers,
    this.navBarMiddle = '',
    this.navBarTrailing,
    this.navBarLeading,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Get.theme.appBarTheme.backgroundColor,
        automaticallyImplyLeading: true,
        leading: navBarLeading,
        middle: Text(navBarMiddle),
        trailing: navBarTrailing ??
            InkWell(
              onTap: () => Get.toNamed(Routes.account),
              child: const Icon(
                CupertinoIcons.profile_circled,
              ),
            ),
      ),
      child: SafeArea(
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
