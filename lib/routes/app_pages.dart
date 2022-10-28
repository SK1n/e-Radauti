import 'package:flutterapperadauti/bindings/download_data_from_url_bindings.dart';
import 'package:flutterapperadauti/modules/air_quality/bindings/air_quality_bindings.dart';
import 'package:flutterapperadauti/modules/announcements/bindings/get_e_radauti_data_bindings.dart';
import 'package:flutterapperadauti/modules/events/bindings/events_bindings.dart';
import 'package:flutterapperadauti/bindings/notifications_switch_bindings.dart';
import 'package:flutterapperadauti/modules/air_quality/views/air_quality_page.dart';
import 'package:flutterapperadauti/modules/announcements/views/announcements_page.dart';
import 'package:flutterapperadauti/modules/announcements/views/furniture_page.dart';
import 'package:flutterapperadauti/modules/announcements/views/job_page.dart';
import 'package:flutterapperadauti/modules/announcements/views/local_announcements_page.dart';
import 'package:flutterapperadauti/modules/events/views/events_page.dart';
import 'package:flutterapperadauti/modules/menu/menu_screen.dart';
import 'package:flutterapperadauti/modules/notice_a_problem/bindings/form_binding.dart';
import 'package:flutterapperadauti/modules/notice_a_problem/views/notice_problem_page.dart';
import 'package:flutterapperadauti/modules/notice_a_problem/bindings/notice_problem_map_bindings.dart';
import 'package:flutterapperadauti/modules/onboard/onboard.dart';
import 'package:flutterapperadauti/modules/screens/views/about_us_page.dart';
import 'package:flutterapperadauti/modules/screens/views/confidential_page.dart';
import 'package:flutterapperadauti/modules/screens/views/partner_page.dart';
import 'package:flutterapperadauti/modules/settings/app_settings.dart';
import 'package:flutterapperadauti/modules/settings/debug_settings.dart';
import 'package:flutterapperadauti/modules/town_hall/bindings/local_legislation_bindings.dart';
import 'package:flutterapperadauti/modules/town_hall/views/leaders_page.dart';
import 'package:flutterapperadauti/modules/town_hall/views/local_legislation_page.dart';
import 'package:flutterapperadauti/modules/town_hall/views/local_council_page.dart';
import 'package:flutterapperadauti/modules/town_hall/views/local_meetings_page.dart';
import 'package:flutterapperadauti/modules/town_hall/views/town_hall_page.dart';
import 'package:flutterapperadauti/modules/transport/views/transport_page.dart';
import 'package:flutterapperadauti/modules/transport/views/bus_page.dart';
import 'package:flutterapperadauti/modules/transport/views/taxi_page.dart';
import 'package:flutterapperadauti/modules/transport/views/train_page.dart';
import 'package:flutterapperadauti/modules/transport/views/timeline_route.dart';
import 'package:flutterapperadauti/modules/usefull_numbers/views/local_authorities_page.dart';
import 'package:flutterapperadauti/modules/usefull_numbers/views/local_disturbance_page.dart';
import 'package:flutterapperadauti/modules/usefull_numbers/views/usefull_numbers_page.dart';
import 'package:flutterapperadauti/modules/usefull_numbers/views/public_institutions_page.dart';
import 'package:flutterapperadauti/modules/volunteer/views/volunteer_page.dart';
import 'package:get/route_manager.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const String INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: Routes.HOME,
        page: () => const MenuScreen(),
        preventDuplicates: true,
        children: [
          GetPage(
            name: _Paths.SETTINGS,
            page: () => const AppSettings(),
            children: [
              GetPage(name: _Paths.DEBUG, page: () => const DebugSettings()),
            ],
          ),
          GetPage(
            name: _Paths.ABOUT,
            page: () => const AboutUsPage(),
          ),
          GetPage(
            name: _Paths.CONFIDENTIAL,
            page: () => const Confidential(),
          ),
          GetPage(
            name: _Paths.PARTNER,
            page: () => const PartnerPage(),
          ),
          GetPage(
            name: _Paths.VOLUNTEER,
            page: () => const VolunteerPage(),
          ),
          GetPage(
            name: _Paths.TRANSPORT,
            page: () => const TransportPage(),
            children: [
              GetPage(
                name: _Paths.TAXI,
                page: () => const TaxiPage(),
              ),
              GetPage(
                  name: _Paths.BUS,
                  page: () => const BusPage(),
                  bindings: const []),
              GetPage(
                name: _Paths.TRAIN,
                page: () => const TrainPage(),
                children: [
                  GetPage(
                    name: _Paths.TRAIN_TIMELINE,
                    page: () => const TimelineRoute(),
                  ),
                ],
              ),
            ],
          ),
          GetPage(
              name: _Paths.AIR,
              page: () => const AirQualityPage(),
              bindings: [
                AirQualityBindings(),
              ]),
          GetPage(
            name: _Paths.NOTICE_PROBLEM,
            page: () => const NoticeProblemPage(),
            bindings: [NoticeProblemFormBindings(), NoticeProblemMapBinding()],
            preventDuplicates: true,
          ),
          GetPage(
              name: _Paths.EVENTS,
              page: () => const EventsPage(),
              bindings: [
                EventsBindings(),
              ]),
          GetPage(
              name: _Paths.ANNOUNCEMENTS,
              page: () => const AnnouncementsPage(),
              children: [
                GetPage(
                  name: _Paths.LOCAL_ANNOUNCEMENTS,
                  page: () => const LocalAnnouncementsPage(),
                ),
                GetPage(
                  name: _Paths.JOBS,
                  page: () => const JobPage(),
                  bindings: [
                    GetERadautiDataBinding(),
                    DownloadDataFromUrlBindings(),
                  ],
                ),
                GetPage(
                  name: _Paths.FURNITURE,
                  page: () => const FurniturePage(),
                  bindings: [
                    GetERadautiDataBinding(),
                    DownloadDataFromUrlBindings(),
                  ],
                ),
              ]),
          GetPage(
              name: _Paths.TOWN_HALL,
              page: () => const TownHallMain(),
              children: [
                GetPage(
                  name: _Paths.LEADERS,
                  page: () => const LeadersPage(),
                ),
                GetPage(
                  name: _Paths.LOCAL_COUNCIL,
                  page: () => const LocalCouncilPage(),
                ),
                GetPage(
                  name: _Paths.LOCAL_MEETINGS,
                  page: () => const LocalMeetingsPage(),
                ),
                GetPage(
                  name: _Paths.LOCAL_LEGISLATION,
                  page: () => const LocalLegislationPage(),
                  binding: LocalLegislationBinding(),
                ),
              ]),
          GetPage(
              name: _Paths.PHONE_NUMBERS,
              page: () => const UsefullNumbersPage(),
              children: [
                GetPage(
                  name: _Paths.LOCAL_AUTHORITIES,
                  page: () => const LocalAuthoritiesPage(),
                ),
                GetPage(
                  name: _Paths.PUBLIC_INSTITUTIONS,
                  page: () => const PublicInstitutionsPage(),
                ),
                GetPage(
                  name: _Paths.LOCAL_DISTURBANCE,
                  page: () => const LocalDisturbancePage(),
                ),
              ]),
        ]),
    GetPage(
        name: Routes.ONBOARD,
        page: () => const Onboard(),
        bindings: [NotificationsSwitchBindings()]),
  ];
}
