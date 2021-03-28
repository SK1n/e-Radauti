import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/air_quality/air_quality.dart';
import 'package:flutterapperadauti/constants/route_names.dart';
import 'package:flutterapperadauti/events/main.dart';
import 'package:flutterapperadauti/jobs/main_page_jobs.dart';
import 'package:flutterapperadauti/main_page_model.dart';
import 'package:flutterapperadauti/notice_a_problem/layout_notice_a_problem.dart';
import 'package:flutterapperadauti/town_hall/council_meetings.dart';
import 'package:flutterapperadauti/usefull_numbers/local_authorities.dart';
import 'package:flutterapperadauti/notice_a_problem/layout_notice_a_problem.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case EventsRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: EventsMain(),
      );
    case NoticeProblemRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LayoutNoticeProblem(),
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
    case NoticeProblemRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LayoutNoticeProblem(),
      );
    default:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: MenuScreen(),
      );
  }
}

/*
  ! To add one more route add one more case to the switch above like this:
    case [RouteName] :  -- this name will be defined in lib/constants/route_names.dart
    routeName: setting.name, (this line always remains the same)
    viewToShow: [Screen that we're gonna show] let's say for example MenuScreen(),
    We're done here now let's go to lib/constants/route_names.dart
*/

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
