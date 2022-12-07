import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:flutterapperadauti/bindings/app_bindings.dart';
import 'package:flutterapperadauti/controllers/dark_mode_switch_controller.dart';
import 'package:flutterapperadauti/localization/languages.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/is_first_run.dart';
import 'package:flutterapperadauti/utils/services/cloud_messaging_service.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final cloudMessagingService = CloudMessagingService();
  Get.lazyPut(() => cloudMessagingService);
  bool isFirstRun = await IsFirstRun.isFirstRun();
  final DarkModeSwitchController darkModeSwitchController =
      Get.put(DarkModeSwitchController());
  darkModeSwitchController.getThemeStatus();
  runApp(
    GetMaterialApp(
      title: 'e-Rădăuți',
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      getPages: AppPages.routes,
      initialRoute: isFirstRun ? Routes.onboard : Routes.signIn,
      initialBinding: AppBindings(),
      locale: Get.deviceLocale,
      translations: Languages(),
      theme: FlexThemeData.light(
        scheme: FlexScheme.barossa,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffoldVariantDialog,
        blendLevel: 20,
        appBarOpacity: 0.95,
        tabBarStyle: FlexTabBarStyle.universal,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          blendOnColors: false,
          inputDecoratorIsFilled: true,
          inputDecoratorBorderType: FlexInputBorderType.underline,
          inputDecoratorRadius: 4.0,
          inputDecoratorFillColor: FlexColor.lightScaffoldBackground,
        ),
        useMaterial3ErrorColors: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.bigStone,
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 15,
        appBarElevation: 1.0,
        tabBarStyle: FlexTabBarStyle.universal,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 30,
          inputDecoratorIsFilled: true,
          inputDecoratorBorderType: FlexInputBorderType.underline,
          inputDecoratorRadius: 4.0,
          inputDecoratorFillColor: FlexColor.darkScaffoldBackground,
        ),
        useMaterial3ErrorColors: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      navigatorKey: Get.key,
    ),
  );
}
