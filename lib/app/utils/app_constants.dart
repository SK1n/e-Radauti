import 'package:flutter/material.dart';
import 'package:flutterapperadauti/gen/colors.gen.dart';

class AppConstants {
  AppConstants._();

  static const String blurHash = 'LEHV6nWB2yk8pyo0adR*.7kCMdnj';

  static const String airQualityLink =
      'https://calitateaer.radautiulcivic.ro/wp-content/uploads/2023/06/Calitatea_aerului_e-Radauti_App.html';

  static const String airQualityChartsLink =
      'https://calitateaer.radautiulcivic.ro/wp-content/uploads/2023/06/Calitatea_aerului_e-Radauti_Grafice_App.html';

  static const String airQualityMapLink =
      'https://calitateaer.radautiulcivic.ro/wp-content/uploads/2023/06/Calitatea_aerului_e-Radauti_Harta_App.html';

  static const String baseERadautiLink =
      'https://www.eradauti.ro/anunturi/locuri-de-munca-20/';

  static const double expandedHeight = 150.0;

  static const Radius cardRadius = Radius.circular(30.0);

  static BorderRadius borderRadius = BorderRadius.circular(30.0);

  static const EdgeInsets innerCardPadding = EdgeInsets.all(15.0);

  static const EdgeInsets smallTopDelimiter = EdgeInsets.only(top: 5);

  static const EdgeInsets topDelimiter = EdgeInsets.only(top: 10);

  static const EdgeInsets leftDelimiter = EdgeInsets.only(left: 10);

  static const int textMaxLines = 10;

  static const titleBigTextStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: ColorName.titleColor,
  );

  static const textTextStyle = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: ColorName.textColor,
  );

  static const smallTextTextStyle = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: ColorName.textColor,
  );

  static const linkTextStyle = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: ColorName.chefchaouenBlue,
  );

  static const appBarTitleStyle = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    color: ColorName.chefchaouenBlue,
  );

  static const unselectedTabStyle = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: ColorName.textColor,
  );
  static const selectedTabStyle = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: ColorName.russianVioler,
  );

  static const buttonTextStyle = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}
