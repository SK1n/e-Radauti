import 'package:flutterapperadauti/utils/helpers/get_data_firebase.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

extension on String {
  convert() {
    return replaceAll('T', ' ').replaceAll('Z', ' ').replaceRange(17, null, '');
  }
}

class AirQualityController extends GetxController with GetDataFirebase {
  String formatDate(String date) {
    DateFormat inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    DateFormat outputFormat = DateFormat('dd/MM/yyyy HH:mm');
    DateTime inputDate = inputFormat.parseUTC(date.convert()).toLocal();
    return outputFormat.format(inputDate);
  }
}
