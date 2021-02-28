import 'package:flutterapperadauti/push_notifications_service.dart';
import 'package:get_it/get_it.dart';

import 'NavigationService.dart';
import 'push_notifications_service.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => PushNotificationService());
}
