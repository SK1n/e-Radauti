import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterapperadauti/data/models/taxi/taxi_item_model.dart';
import 'package:flutterapperadauti/data/models/taxi/taxi_model.dart';
import 'package:flutterapperadauti/data/models/train/train_model.dart';
import 'package:flutterapperadauti/utils/base_controller.dart';
import 'package:get/get.dart';

class TransportController extends BaseController {
  final _taxiList = [].obs;
  get taxiList => _taxiList;
  set taxiList(value) => _taxiList.addAll(value);

  final _trainList = [].obs;
  get trainList => _trainList;
  set trainList(value) => _trainList.addAll(value);

  final _isLoading = false.obs;
  get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;

  final _hasErrors = false.obs;
  get hasErrors => _hasErrors.value;
  set hasErrors(value) => _hasErrors.value = value;

  Future<void> getTaxis() async {
    hasErrors = false;
    isLoading = true;
    try {
      DocumentReference dr = fireRepo.firestore.doc('collection/Taxi');
      TaxiModel data = await fireRepo.getDocument(
        document: dr,
        convert: TaxiModel.fromJson,
      );

      for (TaxiItemModel item in data.taxis) {
        item.image = await fireRepo.getImageUrl(item.image);
      }
      taxiList = data.taxis;
    } on Exception {
      hasErrors = true;
    } finally {
      isLoading = false;
    }
  }

  Future<void> getTrains() async {
    hasErrors = false;
    isLoading = true;
    try {
      DocumentReference dr = fireRepo.firestore.doc('collection/Train');
      TrainModel data = await fireRepo.getDocument(
        document: dr,
        convert: TrainModel.fromJson,
      );
      trainList = data.trains;
    } on Exception {
      hasErrors = true;
    } finally {
      isLoading = false;
    }
  }

  @override
  void onReady() async {
    await getTaxis();
    super.onReady();
  }
}
