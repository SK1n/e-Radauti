import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterapperadauti/data/models/e_radauti_website/context_model.dart';
import 'package:flutterapperadauti/data/models/e_radauti_website/e_radauti_model.dart';
import 'package:flutterapperadauti/data/models/e_radauti_website/posts_model.dart';
import 'package:flutterapperadauti/data/models/e_radauti_website/records_model.dart';

class ERadautiWebsiteClient {
  const ERadautiWebsiteClient();

  Future getData(String url) async {
    try {
      var response = await Dio().get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = response.data;
        ERadautiModel data = ERadautiModel.fromJson(jsonResponse);
        ERContextModel? context = data.context;
        PostsModel? posts = context!.posts;
        List<RecordsModel>? records = posts!.records;
        return records;
      } else if (kDebugMode) {
        print('erro -get');
      }
    } catch (e) {
      rethrow;
    }
  }
}
