import 'package:flutter/material.dart';
import 'package:flutterapperadauti/transport/timeline.dart';

class ListTileRoute extends StatelessWidget {
  const ListTileRoute(
      {Key key,
      @required this.leadinIcon,
      @required this.title,
      @required this.timeArray,
      @required this.trainRoute,
      this.subTitle,
      this.trailingIcon = Icons.arrow_forward_ios})
      : super(key: key);

  final IconData leadinIcon;
  final String title;
  final List<dynamic> timeArray;
  final List<dynamic> trainRoute;
  final String subTitle;
  final IconData trailingIcon;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TimelineRoute(
                      title: title,
                      trainRoute: trainRoute,
                      timeTable: timeArray)));
        },
        leading: Container(
          width: 30,
          alignment: Alignment.center,
          child: Icon(leadinIcon),
        ),
        title: Container(
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(fontSize: 20),
          ),
        ),
        subtitle: Center(child: Text('$subTitle')),
        trailing: Container(
          child: Icon(trailingIcon),
        ),
      ),
    );
  }
}
