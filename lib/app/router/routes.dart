import 'package:flutter/material.dart';
import '../bloc/app_bloc.dart';
import '../pages/home/view/page_home.dart';
import '../pages/login/view/page_login.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [PageHome.page()];
    case AppStatus.unauthenticated:
      return [PageLogin.page()];
  }
}
