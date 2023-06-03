import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterapperadauti/data/clients/local_legislation_client.dart';
import 'package:flutterapperadauti/data/models/leaders/leaders_item_model.dart';
import 'package:flutterapperadauti/data/models/leaders/leaders_model.dart';
import 'package:flutterapperadauti/data/models/local_council/local_council_item_model.dart';
import 'package:flutterapperadauti/data/models/local_council/local_council_model.dart';
import 'package:flutterapperadauti/data/models/local_legislation/local_legislation_model.dart';
import 'package:flutterapperadauti/data/models/local_meetings/local_meetings_item_model.dart';
import 'package:flutterapperadauti/data/models/local_meetings/local_meetings_model.dart';
import 'package:flutterapperadauti/utils/base_controller.dart';
import 'package:get/get.dart';

class TownHallController extends BaseController {
  final TownHallClient client;
  TownHallController(this.client);

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

  Future<List<LocalCouncilItemModel>> getLocalCouncil() async {
    final DocumentReference dr =
        fireRepo.firestore.doc('collection/LocalCouncil');
    try {
      LocalCouncilModel data = await fireRepo.getDocument(
        document: dr,
        convert: LocalCouncilModel.fromJson,
      );
      List<LocalCouncilItemModel> list = data.items;
      for (LocalCouncilItemModel item in list) {
        item.url = await fireRepo.getImageUrl(item.url);
      }
      return list;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<LeadersItemModel>> getLeaders() async {
    final DocumentReference dr = fireRepo.firestore.doc('collection/Leaders');
    try {
      LeadersModel data = await fireRepo.getDocument(
        document: dr,
        convert: LeadersModel.fromJson,
      );
      return data.items;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<LocalMeetingsItemModel>> getLocalMeetings() async {
    final DocumentReference dr = fireRepo.firestore.doc(
      'collection/CouncilMeetings',
    );
    try {
      LocalMeetingsModel data = await fireRepo.getDocument(
        document: dr,
        convert: LocalMeetingsModel.fromJson,
      );
      return data.items;
    } catch (e) {
      rethrow;
    }
  }
}
