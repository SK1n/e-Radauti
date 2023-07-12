import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../gen/strings.g.dart';
import '../../bloc/app_bloc.dart';
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
                    leading:
                        Image.asset('assets/drawer/report_problem_icon.png'),
                    title: Text(t.drawer.reportProblem),
                    onTap: () =>
                        Navigator.of(context).push(ReportProblemPage.route()),
                  ),
                  ListTile(
                    leading: Image.asset(
                        'assets/drawer/local_administration_icon.png'),
                    title: Text(t.drawer.localAdministration),
                    onTap: () => Navigator.of(context)
                        .push(PageLocalAdministration.route()),
                  ),
                  ListTile(
                    leading: Image.asset('assets/drawer/events_icon.png'),
                    title: Text(t.drawer.events),
                    onTap: () => Navigator.of(context).push(EventsPage.route()),
                  ),
                  ListTile(
                    leading: Image.asset('assets/drawer/usefull_info_icon.png'),
                    title: Text(t.drawer.transport),
                    onTap: () =>
                        Navigator.of(context).push(PageTransport.route()),
                  ),
                  ListTile(
                    leading: Image.asset('assets/drawer/air_quality_icon.png'),
                    title: Text(t.drawer.airQuality),
                    onTap: () =>
                        Navigator.of(context).push(AirQualityPage.route()),
                  ),
                  ListTile(
                    leading: Image.asset('assets/drawer/team_icon.png'),
                    title: Text(t.drawer.volunteering),
                    onTap: () =>
                        Navigator.of(context).push(PageVolunteering.route()),
                  ),
                  ListTile(
                    leading:
                        Image.asset('assets/drawer/announcements_icon.png'),
                    title: Text(t.drawer.announcements),
                    onTap: () =>
                        Navigator.of(context).push(PageAnnouncements.route()),
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
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: MediaQuery.sizeOf(context).width,
                  child: Row(
                    children: [
                      const Flexible(
                        child: CircleAvatar(
                          child: Text(''),
                          //  fireRepo.getUser()?.displayName!.getIcon() ?? ''),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '',
                              //  fireRepo.getUser()?.displayName ?? '',
                              style: GoogleFonts.inter(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF374151),
                              ),
                            ),
                            Text(
                              '',
                              // fireRepo.getUser()?.email ?? '',
                              style: GoogleFonts.inter(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF6B7280),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // ListTile(
                //   title: Text('my-account'.tr),
                //   onTap: () => Get.toNamed(Routes.account),
                // ),
                // ListTile(
                //   title: Text('settings'.tr),
                //   onTap: () => Get.toNamed(Routes.settings),
                // ),
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

// extension on String {
//   String getIcon() {
//     RegExp regex = RegExp(r'\b(\w)');
//     Iterable<Match> matches = regex.allMatches(this);
//     String firstLetters = matches.map((match) => match.group(1)).join();
//     return firstLetters;
//   }
// }
