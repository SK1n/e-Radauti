import 'package:flutter/material.dart';
import 'package:flutterapperadauti/controllers/notifications_switch_controller.dart';
import 'package:flutterapperadauti/utils/shared_widgets/notification_switch.dart';
import 'package:get/get.dart';

class NotificationSettings extends StatelessWidget {
  const NotificationSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationsSwitchController switchController = Get.find();
    return Card(
      child: Column(
        children: [
          const NotificationSwitch(),
          Column(
            children: switchController.topics.entries
                .map(
                  (item) => ListTile(
                    leading: const Icon(
                      Icons.notifications,
                    ),
                    title: Text(item.key.tr),
                    trailing: Obx(() => Switch(
                          value: switchController.topics.entries
                              .firstWhere((element) => element.key == item.key)
                              .value,
                          onChanged: (sValue) async {
                            await switchController.setSubscription(
                                item.key, sValue);
                          },
                        )),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
