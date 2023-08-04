import 'package:flutter/material.dart';
import 'package:flutterapperadauti/gen/colors.gen.dart';
import 'package:latlong2/latlong.dart' as lat_lng;

class AppConstants {
  AppConstants._();

  static const String blurHash = 'LEHV6nWB2yk8pyo0adR*.7kCMdnj';

  static const String airQualityLink =
      'https://calitateaer.radautiulcivic.ro/wp-content/uploads/2023/06/Calitatea_aerului_e-Radauti_App.html';

  static const String airQualityChartsLink =
      'https://calitateaer.radautiulcivic.ro/wp-content/uploads/2023/06/Calitatea_aerului_e-Radauti_Grafice_App.html';

  static const String airQualityMapLink =
      'https://calitateaer.radautiulcivic.ro/wp-content/uploads/2023/06/Calitatea_aerului_e-Radauti_Harta_App.html';

  static const String airQualityWidgetLink =
      'https://calitateaer.radautiulcivic.ro/wp-content/uploads/2023/07/Calitatea_aerului_e-Radauti_Widget_home.html';

  static const String baseERadautiLink = 'https://www.eradauti.ro/';

  static const String furnitureLink =
      '${baseERadautiLink}api/context?pathname=/anunturi/imobiliare-19';

  static const String furnitureSlug =
      '${baseERadautiLink}anunturi/imobiliare-19/';

  static const String jobsLink =
      '${baseERadautiLink}api/context?pathname=/anunturi/locuri-de-munca-20';

  static const String jobsSlug =
      '${baseERadautiLink}anunturi/locuri-de-munca-20/';

  static const String mapUrlTemplate =
      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';

  static final lat_lng.LatLng centerRadauti =
      lat_lng.LatLng(47.843876, 25.916276);

  static const String firebaseCollection = 'collection/';

  static const String firebaseUser = 'users';

  static const String pathAnnouncements = '${firebaseCollection}Announcements';

  static const String pathEvents = '${firebaseCollection}Events';

  static const String pathOldEvents = '${firebaseCollection}OldEvents';

  static const String pathLocalCouncil = '${firebaseCollection}LocalCouncil';

  static const String pathLeaders = '${firebaseCollection}Leaders';

  static const String pathTaxi = '${firebaseCollection}Taxi';

  static const String pathTrain = '${firebaseCollection}Train';

  static const String pathNumbers = '${firebaseCollection}Numbers';

  static const String pathVolunteering = '${firebaseCollection}Volunteering';

  static const double expandedHeight = 150.0;

  static const Radius cardRadius = Radius.circular(30.0);

  static BorderRadius borderRadius = BorderRadius.circular(30.0);

  static const EdgeInsets innerCardPadding = EdgeInsets.all(15.0);

  static const EdgeInsets smallInnerCardPadding = EdgeInsets.all(10.0);

  static const EdgeInsets smallTopDelimiter = EdgeInsets.only(top: 5.0);

  static const EdgeInsets topDelimiter = EdgeInsets.only(top: 15.0);

  static const EdgeInsets leftDelimiter = EdgeInsets.only(left: 15.0);

  static const EdgeInsets bottomDelimiter = EdgeInsets.only(bottom: 15.0);

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
