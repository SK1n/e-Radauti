import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class WidgetEventModel {
  List<DateTime> listTimeResponse(child) {
    DateTime valueDate;
    DateTime valueDate2;
    valueDate = DateTime.utc(child.yearT, child.monthT, child.dayT, child.hourT, child.minuteT);
    valueDate2 = valueDate.subtract(Duration(hours: 3));
    List<DateTime> returnList = [];
    if (child.startDate != child.endDate) {
      returnList.add(valueDate2);
      returnList.add(valueDate);
      returnList.add(DateTime.tryParse(child.startDate));
      returnList.add(DateTime.tryParse(child.endDate));
    } else {
      returnList.add(valueDate2);
      returnList.add(valueDate);
    }
    return returnList;
  }

  Widget widgetRowTimeLength(child, childWidth){
    double childSizeIcon;
    double childFontSize;
    if (childWidth <= 250) {
      childFontSize = 14.0;
      childSizeIcon = 14.0;
    } else if (childWidth <= 500) {
      childFontSize = 17.0;
      childSizeIcon = 17.0;
    } else {
      childFontSize = 20.0;
      childSizeIcon = 20.0;
    }
    return Column(
      children: <Widget>[
        SizedBox(height: 10.0,),
        Row(
          children: <Widget>[
            SizedBox(
              width: 10.0,
            ),
            Icon(
              Icons.calendar_today_sharp,
              size: childSizeIcon,
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(
              child[2].day.toString() +
                  '.' +
                  child[2].month.toString() +
                  '.' +
                  child[2].year.toString() +
                  '  -  ' +
                  child[3].day.toString() +
                  '.' +
                  child[3].month.toString() +
                  '.' +
                  child[3].year.toString(),
              style: TextStyle(
                fontSize: childFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _onOpen(LinkableElement link) async {
    if (await canLaunch(link.url)) {
      await launch(link.url);
    } else {
      throw 'Nu pot încărca $link';
    }
  }

  Widget widgetScrollOnExpond(child) {
    return ScrollOnExpand(
      scrollOnExpand: true,
      child: ExpandablePanel(
        theme: const ExpandableThemeData(),
        header: Text(''),
        expanded: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Linkify(
                onOpen: _onOpen,
                text: child,
              ),
            ),
          ],
        ),
        builder: (_, collapsed, expanded) {
          return Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Expandable(
              expanded: expanded,
              theme: const ExpandableThemeData(),
            ),
          );
        },
      ),
    );
  }

  Widget textColumn1(child, childSize, childFontWeight, childColor) {
    return Text(
      child,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: childSize,
        fontWeight: childFontWeight,
        color: childColor,
      ),
    );
  }

  Widget rowIconColumn3(childText, childIcon, childContext,
      childPaddingIconLeft, childPaddingTextLeft, childSize1, childSize2) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(childPaddingIconLeft, 5.0, 0.0, 0.0),
          child: Container(
            child: Icon(childIcon, size: childSize1),
          ),
        ),
        SizedBox(
          width: 5.0,
        ),
        Container(
          width: (MediaQuery.of(childContext).size.width / 5) * 2 - 10,
          child: Padding(
            padding: EdgeInsets.fromLTRB(childPaddingTextLeft, 5.0, 0.0, 0.0),
            child: Text(
              childText,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: childSize2,
                color: Colors.grey[800],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget column1(child, childContext, childSize1, childSize2, childSize3) {
    return Column(
      children: <Widget>[
        textColumn1(child.day + '\n' + child.month, childSize1, FontWeight.bold,
            Colors.grey[800]),
        textColumn1(
            '----------', childSize2, FontWeight.normal, Colors.grey[800]),
        new DecoratedBox(
          decoration: new BoxDecoration(
            color: Colors.grey[700],
            borderRadius: BorderRadius.circular(2.0),
          ),
          child: new Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: textColumn1(
                  child.hour, childSize3, FontWeight.normal, Colors.white)),
        ),
      ],
    );
  }

  Widget column2(child, childContext) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              child: Image.network(
                child.imagePath,
                height: MediaQuery.of(childContext).size.height / 5,
                fit: BoxFit.fitHeight,
                width: MediaQuery.of(childContext).size.width / 5,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget column3(
      child, childContext, childRow4, childSize1, childSize2, childSize3) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: (MediaQuery.of(childContext).size.width / 5) * 2,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                child: Text(
                  child.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: childSize1,
                    fontWeight: FontWeight.bold,
                    color: Color(0xAA38A49C),
                  ),
                ),
              ),
            ),
          ],
        ),
        rowIconColumn3('Categoria: ' + child.categoryName, Icons.category,
            childContext, 10.0, 0.0, childSize2, childSize3),
        rowIconColumn3(
            'Organizator: ' + child.organization,
            Icons.account_circle,
            childContext,
            10.0,
            0.0,
            childSize2,
            childSize3),
        rowIconColumn3(child.location, Icons.location_on, childContext, 5.0,
            5.0, childSize2, childSize3),
        childRow4,
      ],
    );
  }
}
