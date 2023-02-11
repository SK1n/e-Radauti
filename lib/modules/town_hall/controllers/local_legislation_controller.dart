import 'package:flutter/foundation.dart';
import 'package:flutterapperadauti/data/clients/local_legislation_client.dart';
import 'package:flutterapperadauti/data/models/local_legislation/local_legislation_model.dart';
import 'package:get/get.dart';

class LocalLegislationController extends GetxController {
  final LocalLegislationClient client;
  LocalLegislationController(this.client);

  final _allResults = [].obs;
  get allResults => _allResults;
  set allResults(value) => _allResults.value = value;
  late LocalLegislationModel _data;

  Future getData(int year) async {
    _data = await client.getData(year);
    allResults = _data.items;
  }

  final _filter = ''.obs;
  get filter => _filter.value;
  set filter(value) => _filter.value = value;

  filterResults() {
    if (filter.isEmpty) {
      allResults = _data.items;
    } else {
      allResults = [];
      allResults = _data.items
          .where((element) => element.title!.contains(filter))
          .toList();
    }
  }
}
