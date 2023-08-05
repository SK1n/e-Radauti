import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/bloc/app_bloc/app_bloc.dart';
import 'package:flutterapperadauti/app/pages/usefull_numbers/view/page_usefull_numbers.dart';
import 'package:flutterapperadauti/app/repository/authentication/authentication_repository.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
import 'package:flutterapperadauti/gen/assets.gen.dart';
import 'package:getwidget/getwidget.dart';

import '../../../gen/strings.g.dart';
import '../../pages/air_quality/view/air_quality_page.dart';
import '../../pages/announcements/view/page_announcements.dart';
import '../../pages/events/view/events_page.dart';
import '../../pages/local_administration/page_local_administration.dart';
import '../../pages/report_problem/view/report_problem_page.dart';
import '../../pages/transport/view/page_transport.dart';
import '../../pages/volunteering/view/page_volunteering.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    //  final FirebaseRepository fireRepo = FirebaseRepository();

    return GFDrawer(
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: Image.asset(Assets.drawer.reportProblemIcon.path),
                    title: Text(t.drawer.reportProblem),
                    onTap: () =>
                        Navigator.of(context).push(ReportProblemPage.route()),
                  ),
                  ListTile(
                    leading:
                        Image.asset(Assets.drawer.localAdministrationIcon.path),
                    title: Text(t.drawer.localAdministration),
                    onTap: () => Navigator.of(context)
                        .push(PageLocalAdministration.route()),
                  ),
                  ListTile(
                    leading: Image.asset(Assets.drawer.eventsIcon.path),
                    title: Text(t.drawer.events),
                    onTap: () => Navigator.of(context).push(EventsPage.route()),
                  ),
                  ListTile(
                    leading: Image.asset(Assets.drawer.publicTransport.path),
                    title: Text(t.drawer.transport),
                    onTap: () =>
                        Navigator.of(context).push(PageTransport.route()),
                  ),
                  ListTile(
                    leading: Image.asset(Assets.drawer.airQualityIcon.path),
                    title: Text(t.drawer.airQuality),
                    onTap: () =>
                        Navigator.of(context).push(AirQualityPage.route()),
                  ),
                  ListTile(
                    leading: Image.asset(Assets.drawer.teamIcon.path),
                    title: Text(t.drawer.volunteering),
                    onTap: () =>
                        Navigator.of(context).push(PageVolunteering.route()),
                  ),
                  ListTile(
                    leading: Image.asset(Assets.drawer.announcementsIcon.path),
                    title: Text(t.drawer.announcements),
                    onTap: () =>
                        Navigator.of(context).push(PageAnnouncements.route()),
                  ),
                  ListTile(
                    leading: Image.asset(Assets.drawer.usefullInfoIcon.path),
                    title: Text(t.drawer.usefullNumbers),
                    onTap: () =>
                        Navigator.of(context).push(PageUsefullNumbers.route()),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FirebaseAuth.instance.currentUser!.isAnonymous
                    ? Container()
                    : Container(
                        padding: AppConstants.innerCardPadding,
                        width: MediaQuery.sizeOf(context).width,
                        child: Row(
                          children: [
                            Flexible(
                              child: CircleAvatar(
                                child: Text(
                                  context
                                      .read<AuthenticationRepository>()
                                      .currentUser
                                      .name!
                                      .getIcon(),
                                ),
                              ),
                            ),
                            Padding(
                              padding: AppConstants.innerCardPadding,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    context
                                        .read<AuthenticationRepository>()
                                        .currentUser
                                        .name!,
                                    style: AppConstants.titleBigTextStyle,
                                  ),
                                  Text(
                                    context
                                        .read<AuthenticationRepository>()
                                        .currentUser
                                        .email!,
                                    style: AppConstants.textTextStyle,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                ListTile(
                    title: Text(t.drawer.signOut),
                    onTap: () {
                      context.read<AppBloc>().add(const AppLogoutRequested());
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

extension on String {
  String getIcon() {
    RegExp regex = RegExp(r'\b(\w)');
    Iterable<Match> matches = regex.allMatches(this);
    String firstLetters = matches.map((match) => match.group(1)).join();
    return firstLetters;
  }
}
