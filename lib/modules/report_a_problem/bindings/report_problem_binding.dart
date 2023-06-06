import 'package:flutterapperadauti/controllers/account_controller.dart';
import 'package:flutterapperadauti/controllers/location_controller.dart';
import 'package:flutterapperadauti/modules/report_a_problem/controllers/my_reports_controller.dart';
import 'package:flutterapperadauti/modules/report_a_problem/controllers/report_problem_controller.dart';
import 'package:get/get.dart';

class ReportProblemBinding implements Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => ReportProblemController()),
      Bind.lazyPut(() => LocationController()),
      Bind.lazyPut(() => AccountController()),
      Bind.lazyPut(() => MyReportsController()),
    ];
  }
}
