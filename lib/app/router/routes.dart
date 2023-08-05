import 'package:flutter/material.dart';
import 'package:flutterapperadauti/app/bloc/app_bloc/app_bloc.dart';
import 'package:flutterapperadauti/app/pages/onboarding/view/page_onboarding.dart';
import '../pages/home/view/page_home.dart';
import '../pages/login/view/page_login.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.isFirstRun:
      return [PageOnboarding.page()];
    case AppStatus.authenticated:
      return [PageHome.page()];
    case AppStatus.unauthenticated:
      return [PageLogin.page()];
  }
}
