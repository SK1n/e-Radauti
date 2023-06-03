import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutterapperadauti/repositories/firebase_repository.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:getwidget/getwidget.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseRepository fireRepo = FirebaseRepository();
    return GFDrawer(
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: Image.asset('assets/drawer/home_icon.png'),
                    title: Text('home'.tr),
                    onTap: () => Get.toNamed(Routes.home),
                  ),
                  ListTile(
                    leading:
                        Image.asset('assets/drawer/report_problem_icon.png'),
                    title: Text('report-problem'.tr),
                    onTap: () => Get.toNamed(Routes.reportProblem),
                  ),
                  ListTile(
                    leading: Image.asset(
                        'assets/drawer/local_administration_icon.png'),
                    title: Text('local_administration'.tr),
                    onTap: () => Get.toNamed(Routes.townHall),
                  ),
                  ListTile(
                    leading: Image.asset('assets/drawer/events_icon.png'),
                    title: Text('events'.tr),
                    onTap: () => Get.toNamed(Routes.events),
                  ),
                  ListTile(
                    leading: Image.asset('assets/drawer/usefull_info_icon.png'),
                    title: Text('usefull-info'.tr),
                    onTap: () => Get.toNamed(''),
                  ),
                  ListTile(
                    leading: Image.asset('assets/drawer/air_quality_icon.png'),
                    title: Text('air-quality'.tr),
                    onTap: () => Get.toNamed(Routes.air),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GFListTile(
                  title: Text(fireRepo.getUser()?.displayName ?? ''),
                  subTitle: Text(fireRepo.getUser()?.email ?? ''),
                ),
                ListTile(
                  title: Text('my-account'.tr),
                  onTap: () => Get.toNamed(Routes.account),
                ),
                ListTile(
                  title: Text('settings'.tr),
                  onTap: () => Get.toNamed(Routes.settings),
                ),
                ListTile(
                  title: Text('sign-out'.tr),
                  onTap: () async {
                    try {
                      await fireRepo.signOut();
                      Get.offAllNamed(Routes.logIn);
                      const FlutterSecureStorage storage =
                          FlutterSecureStorage();
                      storage.delete(key: 'user_email');
                      storage.delete(key: 'user_password');
                    } catch (e) {
                      Get.defaultDialog(
                        title: 'error'.tr,
                        middleText: 'please-retry'.tr,
                        textConfirm: 'Ok',
                        onConfirm: () => Get.back(),
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
