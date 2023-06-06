import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterapperadauti/data/models/notice_problem_map/markers_model.dart';
import 'package:flutterapperadauti/data/models/user/user_model.dart';
import 'package:flutterapperadauti/utils/base_controller.dart';

class MyReportsController extends BaseController<List<MarkersModel>> {
  Future<void> getReports() async {
    futurize(() async {
      final String userUID = fireRepo.getUID();
      DocumentReference dr = fireRepo.firestore.doc('users/$userUID');
      UserModel data = await fireRepo.getDocument(
        document: dr,
        convert: UserModel.fromJson,
      );
      return data.reports;
    });
  }

  @override
  void onReady() async {
    await getReports();
    super.onReady();
  }
}
