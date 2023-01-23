import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/onboard/controllers/onboard_controller.dart';
import 'package:flutterapperadauti/modules/onboard/views/oboard_slides.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/const.dart';
import 'package:get/get.dart';

class Onboard extends StatefulWidget {
  final List<OnboardSlides> list;
  const Onboard({
    super.key,
    required this.list,
  });

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  final OnboardController controller = Get.find();
  @override
  void initState() {
    controller.list = widget.list;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Padding(
        padding: const EdgeInsets.only(left: leftMargin, right: rightMargin),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 50,
            ),
            Flexible(
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: controller.list.length,
                onPageChanged: (page) {
                  controller.page = page;
                },
                itemBuilder: (BuildContext context, int index) {
                  return OnboardSlides(
                    title: controller.list[index].title,
                    image: controller.list[index].image,
                    body: controller.list[index].body,
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Obx(
                  () => controller.page == 0
                      ? Container()
                      : TextButton(
                          onPressed: () {
                            if (controller.page > 0) {
                              controller.page -= 1;
                              controller.pageController.previousPage(
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.easeOut);
                            }
                          },
                          child: Obx(
                            () => Text(
                              controller.page == controller.list.length - 1
                                  ? 'back'.tr
                                  : 'back'.tr,
                            ),
                          ),
                        ),
                ),
                TextButton(
                  onPressed: () {
                    if (controller.page < controller.list.length - 1) {
                      controller.page += 1;
                      controller.pageController.nextPage(
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeIn);
                    } else {
                      Get.offAllNamed(
                        Routes.permissionsPage,
                      );
                    }
                  },
                  child: Text('next'.tr),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
