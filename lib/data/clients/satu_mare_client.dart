import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterapperadauti/data/models/satu_mare/satu_mare_air_quality.dart';

class SatuMareClient {
  SatuMareClient();

  static const String _url =
      'https://device.iqair.com/v2/630ab5439b6b1e6ddca76f80/validated-data';
  Future getData() async {
    try {
      var response = await Dio().get(_url);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = response.data;
        SatuMareAirQuality data = SatuMareAirQuality.fromJson(jsonResponse);
        return data;
      } else if (kDebugMode) {
        print('erro -get');
      }
    } catch (_) {}
  }
}
