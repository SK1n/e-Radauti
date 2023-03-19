import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/controllers/dark_mode_switch_controller.dart';
import 'package:get/get.dart';

class DarkModeSwitch extends StatelessWidget {
  const DarkModeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final DarkModeSwitchController darkModeSwitchController =
        Get.put(DarkModeSwitchController());
    return Visibility(
      visible: kReleaseMode,
      replacement: const SizedBox.shrink(),
      child: Card(
        elevation: 10,
        child: ObxValue(
          (data) => SwitchListTile(
            tileColor: context.theme.cardColor,
            title: const Text('Dark mode'),
            subtitle: const Text('Schimba culorile aplicatiei'),
            value: !darkModeSwitchController.isLightTheme.value,
            onChanged: (val) async {
              darkModeSwitchController.isLightTheme.value = !val;
              Get.changeThemeMode(
                darkModeSwitchController.isLightTheme.value
                    ? ThemeMode.light
                    : ThemeMode.dark,
              );
              await darkModeSwitchController.saveThemeStatus();
            },
          ),
          false.obs,
        ),
      ),
    );
  }
}
