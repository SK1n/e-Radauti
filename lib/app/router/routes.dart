import 'package:flutter/material.dart';
import 'package:flutterapperadauti/app/bloc/app_bloc.dart';
import 'package:flutterapperadauti/app/pages/home/view/home_page.dart';
import 'package:flutterapperadauti/app/pages/login/view/login_page.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
