import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class LegendWidget extends StatelessWidget {
  final String? collapsedTitle;
  final String? expandedTitle;
  final String? expandedContent;
  final Widget? expandedWidget;
  const LegendWidget(
      {Key? key,
      this.collapsedTitle,
      this.expandedContent,
      this.expandedTitle,
      this.expandedWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: ExpandableNotifier(
          child: Column(
            children: [
              ScrollOnExpand(
                child: Expandable(
                  collapsed: ExpandableButton(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(
                              FontAwesome.down_big,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width - 100,
                              child: Text(
                                collapsedTitle!,
                                style: TextStyle(color: Colors.black),
                              )),
                        ],
                      ),
                    ),
                  ),
                  expanded: ExpandableButton(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Padding(
                                child: Icon(FontAwesome.up_big),
                                padding: const EdgeInsets.only(right: 8.0),
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width - 100,
                                  child: Text(expandedTitle!)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 20,
                          child: expandedWidget != null
                              ? expandedWidget
                              : Text(
                                  expandedContent!,
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                  maxLines: 50,
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
