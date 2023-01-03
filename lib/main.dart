import 'package:firebase_auth/firebase_auth.dart';
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
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final cloudMessagingService = CloudMessagingService();
  Get.lazyPut(() => cloudMessagingService);
  bool isFirstRun = await IsFirstRun.isFirstRun();
  final DarkModeSwitchController darkModeSwitchController =
      Get.put(DarkModeSwitchController());
  final User? isSignedIn = FirebaseAuth.instance.currentUser;
  darkModeSwitchController.getThemeStatus();
  runApp(
    GetMaterialApp(
      title: 'e-Rădăuți',
      debugShowCheckedModeBanner: true,
      builder: EasyLoading.init(),
      getPages: AppPages.routes,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ro', 'RO'),
      ],
      initialRoute: isFirstRun
          ? Routes.onboard
          : isSignedIn != null
              ? Routes.home
              : Routes.signIn,
      initialBinding: AppBindings(),
      locale: const Locale('ro', "RO"),
      translations: Languages(),
      theme: FlexThemeData.light(
        scheme: FlexScheme.materialHc,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 9,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: false,
          bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.primary,
          bottomNavigationBarSelectedIconSchemeColor: SchemeColor.primary,
          bottomNavigationBarBackgroundSchemeColor: SchemeColor.surfaceVariant,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        // To use the playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.materialHc,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 15,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.primary,
          bottomNavigationBarSelectedIconSchemeColor: SchemeColor.primary,
          bottomNavigationBarBackgroundSchemeColor: SchemeColor.surfaceVariant,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        // To use the Playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      themeMode: ThemeMode.light,
      navigatorKey: Get.key,
    ),
  );
}
