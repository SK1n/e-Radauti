import 'package:flutterapperadauti/data/clients/e_radauti_website_client.dart';
import 'package:flutterapperadauti/data/models/e_radauti_website/records_model.dart';
import 'package:get/get.dart';

class GetERadautiDataController extends GetxController {
  final ERadautiWebsiteClient client;
  GetERadautiDataController(this.client);

  Future<List<RecordsModel>?> getData(String category) async {
    return await client.getData(category);
  }
}
