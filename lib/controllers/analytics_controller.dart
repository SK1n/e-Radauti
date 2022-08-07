import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AnalyticsController extends GetxController {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);
  Future addToAnalytics(String text) async {
    await _analytics
        .logEvent(name: 'notification_payload', parameters: {'text': '$text'});
  }
}
