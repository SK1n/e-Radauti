import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterapperadauti/data/clients/e_radauti_website_client.dart';
import 'package:flutterapperadauti/data/models/e_radauti_website/records_model.dart';
import 'package:flutterapperadauti/data/models/local_announcements/local_announcements_item_model.dart';
import 'package:flutterapperadauti/data/models/local_announcements/local_announcements_model.dart';
import 'package:flutterapperadauti/utils/base_controller.dart';

class AnnouncementsController extends BaseController {
  final ERadautiWebsiteClient client;
  AnnouncementsController(this.client);

  Future<List<RecordsModel>?> getERadautiData(String category) async {
    return await client.getData(category);
  }

  Future<List<LocalAnnouncementsItemModel>> getLocalAnnouncements() async {
    DocumentReference dr = fireRepo.firestore.doc('collection/Announcements');
    try {
      final LocalAnnouncementsModel data = await fireRepo.getDocument(
        document: dr,
        convert: LocalAnnouncementsModel.fromJson,
      );
      for (LocalAnnouncementsItemModel item in data.items) {
        item.url = await fireRepo.getImageUrl(item.url);
      }
      return data.items;
    } on Exception {
      rethrow;
    }
  }
}
