import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AppBarUi extends StatelessWidget {
  final IconData? leading;
  final String content;
  final bool pinned;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;
  const AppBarUi({
    super.key,
    required this.content,
    this.leading,
    this.pinned = false,
    this.bottom,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      centerTitle: centerTitle,
      bottom: bottom ??
          PreferredSize(
            preferredSize: const Size(0, 0),
            child: Container(),
          ),
      automaticallyImplyLeading: true,
      title: Row(
        children: [
          leading != null
              ? Icon(
                  leading,
                )
              : Container(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                content,
                maxLines: 1,
              ),
            ),
          )
        ],
      ),
    );
  }
}
