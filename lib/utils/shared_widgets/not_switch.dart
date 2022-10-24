import 'package:flutter/material.dart';
import 'package:flutterapperadauti/controllers/notifications_switch_controller.dart';
import 'package:get/get.dart';

class NotSwitch extends StatefulWidget {
  const NotSwitch({super.key});

  @override
  State<NotSwitch> createState() => _NotSwitchState();
}

class _NotSwitchState extends State<NotSwitch> {
  final NotificationsSwitchController _controller =
      Get.put(NotificationsSwitchController());
  @override
  void initState() {
    _controller.getSharedPreferencesValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: const Text('Notificari'),
        leading: const Icon(Icons.notification_add),
        trailing: Obx(() => Switch(
              value: _controller.switchValue,
              onChanged: (value) async {
                _controller.switchValue = value;
                await _controller.printToken();
                if (_controller.switchValue) {
                  _controller.subscribeToNotifications();
                } else {
                  _controller.unsubscribeFromNotifications();
                }
              },
            )),
      ),
    );
  }
}
