import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../models/e_radauti_website/e_radauti_website_model.dart';

class ERadautiWebsiteFetchFailure implements Exception {
  /// Create a Firestore fetch failure with the specified [message].
  const ERadautiWebsiteFetchFailure(this.message);

  /// The associated error message.
  final String message;
}

class ERadautiWebsiteRepository {
  const ERadautiWebsiteRepository();

  Future<ERadautiWebsiteModel> fetchData(String url) async {
    try {
      final Dio dio = Dio();
      var response = await dio.get(url);
      if (response.statusCode != 200) {
        throw ERadautiWebsiteFetchFailure(response.statusMessage ?? '');
      }
      ERadautiWebsiteModel data = ERadautiWebsiteModel.fromJson(response.data);
      return data;
    } on DioException catch (e) {
      Logger log = Logger();
      log.e(e);
      throw ERadautiWebsiteFetchFailure(e.message ?? '');
    } catch (e) {
      Logger log = Logger();
      log.e(e);
      throw const ERadautiWebsiteFetchFailure('');
    }
  }
}
