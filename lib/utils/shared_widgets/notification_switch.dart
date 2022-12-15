import 'package:flutter/material.dart';
import 'package:flutterapperadauti/controllers/notifications_switch_controller.dart';
import 'package:get/get.dart';

class NotificationSwitch extends StatelessWidget {
  const NotificationSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationsSwitchController switchController = Get.find();
    return Card(
      elevation: 10,
      child: ListTile(
        title: const Text('Notificari'),
        leading: const Icon(Icons.notification_add),
        trailing: Obx(
          () => Switch(
            value: switchController.notificationsEnabled(),
            onChanged: (value) async {
              await switchController.setSubscriptionAll(value);
            },
          ),
        ),
      ),
    );
  }
}
