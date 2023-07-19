import 'package:intl/intl.dart';

extension FormatDate on String {
  String format() {
    DateFormat formatedDate = DateFormat('dd MMMM yyyy', 'ro');

    return formatedDate.format(DateTime.parse(this));
  }
}
