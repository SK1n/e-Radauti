import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:get/get.dart';

class AppBarWidget extends StatelessWidget {
  final IconData? leading;
  final String content;
  final bool pinned;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;
  final Widget? flexibleSpace;
  final double? expandedHeight;
  final Widget? trailing;
  const AppBarWidget({
    super.key,
    required this.content,
    this.leading,
    this.pinned = false,
    this.bottom,
    this.centerTitle = true,
    this.flexibleSpace,
    this.expandedHeight,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverNavigationBar(
      automaticallyImplyLeading: true,
      largeTitle: AutoSizeText(
        content,
        style: const TextStyle(
          color: Colors.blueAccent,
        ),
      ),
      trailing: trailing ??
          InkWell(
            onTap: () => Get.toNamed(Routes.account),
            child: const Icon(
              CupertinoIcons.profile_circled,
            ),
          ),
    );
  }
}
