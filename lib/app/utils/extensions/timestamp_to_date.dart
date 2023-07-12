import 'package:intl/intl.dart';

extension TimestampToDate on num {
  String get getDate {
    DateFormat format = DateFormat('dd MMMM yyyy', 'ro');
    return format
        .format(DateTime.fromMillisecondsSinceEpoch(toInt() * 1000))
        .toUpperCase();
  }

  String get getHour {
    DateFormat format = DateFormat('HH:mm', 'ro');
    return format
        .format(DateTime.fromMillisecondsSinceEpoch(toInt() * 1000))
        .toUpperCase();
  }
}
