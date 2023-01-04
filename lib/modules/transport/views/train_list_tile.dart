import 'package:flutter/material.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:get/get.dart';

class ListTileRoute extends StatelessWidget {
  const ListTileRoute(
      {super.key,
      required this.leadinIcon,
      required this.title,
      required this.timeArray,
      required this.trainRoute,
      required this.subTitle,
      this.trailingIcon = Icons.arrow_forward_ios});

  final IconData leadinIcon;
  final String title;
  final List<dynamic> timeArray;
  final List<dynamic> trainRoute;
  final String subTitle;
  final IconData trailingIcon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Get.put(title, tag: 'title');
          Get.put(trainRoute, tag: 'train_route');
          Get.put(timeArray, tag: 'time_array');
          Get.toNamed(Routes.trainTimeLine, arguments: [
            title,
            trainRoute,
            timeArray,
          ]);
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
            style: const TextStyle(fontSize: 20),
          ),
        ),
        subtitle: Center(
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
          ),
        ),
        trailing: Icon(
          trailingIcon,
        ),
      ),
    );
  }
}
