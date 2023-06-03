import 'package:flutterapperadauti/controllers/account_controller.dart';
import 'package:flutterapperadauti/controllers/location_controller.dart';
import 'package:flutterapperadauti/modules/report_a_problem/controllers/report_problem_controller.dart';
import 'package:get/get.dart';

import '../../../repositories/firebase_repository.dart';

class ReportProblemBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportProblemController>(
      () => ReportProblemController(),
    );
    Get.lazyPut<LocationController>(() => LocationController());
    Get.lazyPut<AccountController>(() => AccountController());
  }
}
