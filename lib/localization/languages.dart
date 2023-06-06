import 'package:flutterapperadauti/localization/en_us.dart';
import 'package:flutterapperadauti/localization/ro_ro.dart';
import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        "ro_RO": roRO,
      };
}
