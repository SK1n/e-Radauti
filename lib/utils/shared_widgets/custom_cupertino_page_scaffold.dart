import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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
        middle: AutoSizeText(
          navBarMiddle,
          style: TextStyle(
            color: Get.theme.appBarTheme.foregroundColor,
          ),
        ),
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
          ),
          child: CustomScrollView(
            slivers: slivers,
          ),
        ),
      ),
    );
  }
}