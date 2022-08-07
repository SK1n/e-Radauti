import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DownloadDataFromUrlController extends GetxController {
  Future getData(String link) async {
    try {
      Dio dio = new Dio();
      dio.interceptors
          .add(DioCacheManager(CacheConfig(baseUrl: link)).interceptor);
      Response response = await dio.get(
        '$link',
        options: buildCacheOptions(
          Duration(days: 7),
          maxStale: Duration(days: 10),
          options: Options(
            responseType: ResponseType.json,
          ),
        ),
      );
      return response.data;
      //   this.setState(() {
      //     jsonResponse = json.decode(response.body);
      //   });
      //   jobList = <JobModel>[];
      //   jsonResponse.forEach((key, value) {
      //     jobList = (jsonResponse['context']['posts']['records'] as List)
      //         .map<JobModel>((j) => JobModel.fromJson(j))
      //         .toList();
      //   });
      //   debugPrint(jobList.length.toString());
    } on Exception catch (e) {
      throw 'Error' + e.toString();
    }
    // return jobList;
  }
}
