import 'package:flutterapperadauti/repositories/firebase_repository.dart';
import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  final FirebaseRepository fireRepo = FirebaseRepository();
  final _isLoading = false.obs;
  get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;

  final _hasErrors = false.obs;
  get hasErrors => _hasErrors.value;
  set hasErrors(value) => _hasErrors.value = value;
}
