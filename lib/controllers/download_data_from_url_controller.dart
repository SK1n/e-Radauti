import 'package:dio/dio.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DownloadDataFromUrlController extends GetxController {
  Future getData(String link) async {
    try {
      Dio dio = Dio();
      Response response = await dio.get(
        link,
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
      throw 'Error: $e';
    }
    // return jobList;
  }
}
