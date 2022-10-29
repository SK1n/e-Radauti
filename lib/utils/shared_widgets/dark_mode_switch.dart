import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterapperadauti/controllers/dark_mode_switch_controller.dart';
import 'package:get/get.dart';

class DarkModeSwitch extends StatelessWidget {
  const DarkModeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final DarkModeSwitchController darkModeSwitchController =
        Get.put(DarkModeSwitchController());
    return ObxValue(
      (data) => SwitchListTile(
        title: const Text('Dark mode'),
        subtitle: const Text('Schimba culorile aplicatiei'),
        value: darkModeSwitchController.isLightTheme.value,
        onChanged: (val) async {
          darkModeSwitchController.isLightTheme.value = val;
          Get.changeThemeMode(
            darkModeSwitchController.isLightTheme.value
                ? ThemeMode.dark
                : ThemeMode.light,
          );
          await darkModeSwitchController.saveThemeStatus();
        },
      ),
      false.obs,
    );
  }
}
