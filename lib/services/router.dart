import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/air_quality/air_quality.dart';
import 'package:flutterapperadauti/constants/route_names.dart';
import 'package:flutterapperadauti/events/main.dart';
import 'package:flutterapperadauti/jobs/main_page_jobs.dart';
import 'package:flutterapperadauti/main_page_model.dart';
import 'package:flutterapperadauti/town_hall/council_meetings.dart';
import 'package:flutterapperadauti/usefull_numbers/local_authorities.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case EventsRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: EventsMain(),
      );
    case AnnouncementsRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomePageJobs(),
      );
    case CouncilMeetingsRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: CouncilMeetings(),
      );
    case LocalAuthoritieRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LocalAuthorities(),
      );
    case AirQualityRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: AirQualityPage(),
      );
    default:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: MenuScreen(),
      );
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
