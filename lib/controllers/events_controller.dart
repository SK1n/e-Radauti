import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class EventsController extends GetxController {
  dynamic hasData = false.obs;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> registerNotification(
      int id, int time, String headline, String description) async {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Europe/Bucharest'));
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channel ID', 'channel Name',
            channelDescription: 'channel Description',
            priority: Priority.high,
            importance: Importance.max,
            ticker: 'test');
    IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();
    tz.TZDateTime currentTime = tz.TZDateTime.now(tz.local).add(
        DateTime.fromMillisecondsSinceEpoch(time)
            .difference(tz.TZDateTime.now(tz.local)));

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: iosNotificationDetails);
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id, '$headline', '$description', currentTime, notificationDetails,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: 'events');
  }

  String convertTimestampToDate(int timestamp) {
    var format = new DateFormat('dd/MM/yyyy HH:mm');
    var time =
        format.format(DateTime.fromMillisecondsSinceEpoch(timestamp * 1000));
    return time;
  }

  String formatDateForImageOverlay(int timestamp) {
    initializeDateFormatting('ro');
    var date = DateFormat('EEEEE dd/MM/yyyy HH:mm', 'ro')
        .format(DateTime.fromMillisecondsSinceEpoch(timestamp * 1000))
        .toUpperCase();
    return date;
  }

  Future<bool> hasEnabledNotification(int id) async {
    return await flutterLocalNotificationsPlugin
        .pendingNotificationRequests()
        .then((value) {
      return value.any((element) => element.id == id);
    });
  }
}
