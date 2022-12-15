import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/controllers/notifications_switch_controller.dart';
import 'package:get/get.dart';

class SettingsNotification extends StatelessWidget {
  const SettingsNotification({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationsSwitchController switchController = Get.find();
    return Column(
        children: switchController.topics.entries
            .map(
              (item) => ListTile(
                leading: const Icon(
                  Icons.notifications,
                ),
                title: Text(item.key.toUpperCase()),
                trailing: Obx(
                  () => Switch(value: item.value, onChanged: (value) {}),
                ),
              ),
            )
            .toList());
  }
}
