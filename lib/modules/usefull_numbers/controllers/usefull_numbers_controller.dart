import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterapperadauti/data/models/usefull_numbers/usefull_numbers_model.dart';
import 'package:flutterapperadauti/utils/base_controller.dart';
import 'package:get/get.dart';

class UsefullNumbersController extends BaseController {
  final _publicInstitutions = [].obs;
  get publicInstitutions => _publicInstitutions;
  set publicInstitutions(value) => _publicInstitutions.addAll(value);

  final _localUpsets = [].obs;
  get localUpsets => _localUpsets;
  set localUpsets(value) => _localUpsets.addAll(value);

  final _localAuthorities = [].obs;
  get localAuthorities => _localAuthorities;
  set localAuthorities(value) => _localAuthorities.addAll(value);

  Future<void> getData() async {
    hasErrors = false;
    isLoading = true;
    final DocumentReference dr = fireRepo.firestore.doc(
      'collection/Numbers',
    );
    try {
      UsefullNumbersModel data = await fireRepo.getDocument(
        document: dr,
        convert: UsefullNumbersModel.fromJson,
      );
      publicInstitutions = data.publicInstitutions;
      localAuthorities = data.localAuthorities;
      localUpsets = data.localUpsets;
    } catch (e) {
      hasErrors = true;
    } finally {
      isLoading = false;
    }
  }

  @override
  void onReady() async {
    await getData();
    super.onReady();
  }
}
