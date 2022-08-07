import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:is_first_run/is_first_run.dart';

class FirstRunController extends GetxController {
  Future<bool> get firstRun => isFirstRun();

  Future<bool> isFirstRun() async {
    return await IsFirstRun.isFirstRun();
  }
}
