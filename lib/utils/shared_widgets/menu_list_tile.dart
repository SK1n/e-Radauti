import 'package:flutter/material.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:get/get.dart';

class MenuListTile extends StatelessWidget {
  final String route;
  final String title;
  final String subtitle;
  const MenuListTile(
      {super.key,
      required this.title,
      this.subtitle = '',
      this.route = Routes.home});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(route),
      child: Card(
        child: SizedBox(
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: ListTile(
              leading: const Icon(Icons.list),
              title: Text(title),
              subtitle: Text(subtitle),
              trailing: const Icon(Icons.arrow_right_sharp),
            ),
          ),
        ),
      ),
    );
  }
}
