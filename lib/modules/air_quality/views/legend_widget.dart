import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/helpers/launch_url_helper.dart';
import 'package:selectable_autolink_text/selectable_autolink_text.dart';

class LegendWidget extends StatelessWidget with UrlLauncher {
  final String? collapsedTitle;
  final String? expandedTitle;
  final String? expandedContent;
  final Widget? expandedWidget;
  const LegendWidget(
      {super.key,
      this.collapsedTitle,
      this.expandedContent,
      this.expandedTitle,
      this.expandedWidget});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: ExpandableNotifier(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expandable(
                collapsed: ExpandableButton(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      collapsedTitle!.toUpperCase(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                expanded: ExpandableButton(
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 100,
                        child: Text(
                          expandedTitle!.toUpperCase(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 20,
                        child: expandedWidget ??
                            SelectableAutoLinkText(
                              expandedContent!,
                              textAlign: TextAlign.start,
                              onTransformDisplayLink: AutoLinkUtils.shrinkUrl,
                              linkStyle:
                                  const TextStyle(color: Colors.pinkAccent),
                              onTap: (link) async {
                                await launchUrl(link);
                              },
                            ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
