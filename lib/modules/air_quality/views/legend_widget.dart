import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/helpers/launch_url_helper.dart';
import 'package:fluttericon/font_awesome_icons.dart';
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
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: ExpandableNotifier(
          child: Column(
            children: [
              ScrollOnExpand(
                child: Expandable(
                  collapsed: ExpandableButton(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Icon(
                              FontAwesome.down_big,
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width - 100,
                              child: Text(
                                collapsedTitle!,
                              )),
                        ],
                      ),
                    ),
                  ),
                  expanded: ExpandableButton(
                    child: Column(
                      children: [
                        Card(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Icon(FontAwesome.up_big),
                                ),
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 100,
                                    child: Text(expandedTitle!)),
                              ],
                            ),
                          ),
                        ),
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
                                  launchUrl(link);
                                },
                              ),
                        ),
                      ],
                    ),
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
