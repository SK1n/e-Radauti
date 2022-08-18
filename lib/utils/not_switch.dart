import 'package:flutter/material.dart';
import 'package:flutterapperadauti/controllers/notifications_switch_controller.dart';
import 'package:get/get.dart';

class NotSwitch extends StatelessWidget {
  const NotSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NotificationsSwitchController _controller = Get.find();
    return Card(
      child: ListTile(
        title: Text('Notificari'),
        leading: Icon(Icons.notification_add),
        trailing: TextButton(
          child: Text('Acorda'),
          onPressed: () => _controller.askForPermissions(),
        ),
      ),
    );
  }
}
