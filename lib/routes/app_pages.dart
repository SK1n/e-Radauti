import 'package:flutterapperadauti/bindings/download_data_from_url_bindings.dart';
import 'package:flutterapperadauti/bindings/download_image_bindigns.dart';
import 'package:flutterapperadauti/bindings/events_bindings.dart';
import 'package:flutterapperadauti/bindings/notifications_switch_bindings.dart';
import 'package:flutterapperadauti/modules/air_quality/air_quality_main.dart';
import 'package:flutterapperadauti/modules/announcements/announcements_main.dart';
import 'package:flutterapperadauti/modules/announcements/screens/furniture/furniture_page.dart';
import 'package:flutterapperadauti/modules/announcements/screens/jobs/job_page.dart';
import 'package:flutterapperadauti/modules/announcements/screens/local_announcements/local_announcements.dart';
import 'package:flutterapperadauti/modules/events/main.dart';
import 'package:flutterapperadauti/modules/menu/menu_screen.dart';
import 'package:flutterapperadauti/modules/notice_a_problem/screens/form/bindings/form_binding.dart';
import 'package:flutterapperadauti/modules/notice_a_problem/screens/main_notice_ui.dart';
import 'package:flutterapperadauti/modules/notice_a_problem/screens/map/notice_map_ui.dart';
import 'package:flutterapperadauti/modules/onboard/onboard.dart';
import 'package:flutterapperadauti/modules/screens/about_us/about_us_main.dart';
import 'package:flutterapperadauti/modules/screens/confidential/confidential.dart';
import 'package:flutterapperadauti/modules/screens/partner/utils/partner.dart';
import 'package:flutterapperadauti/modules/settings/app_settings.dart';
import 'package:flutterapperadauti/modules/settings/debug_settings.dart';
import 'package:flutterapperadauti/modules/town_hall/screens/leaders/leaders.dart';
import 'package:flutterapperadauti/modules/town_hall/screens/legislation/legislation.dart';
import 'package:flutterapperadauti/modules/town_hall/screens/local_council/local_council.dart';
import 'package:flutterapperadauti/modules/town_hall/screens/local_meetings/local_meetings.dart';
import 'package:flutterapperadauti/modules/town_hall/town_hall_main.dart';
import 'package:flutterapperadauti/modules/transport/Transport.dart';
import 'package:flutterapperadauti/modules/transport/screens/bus/Bus.dart';
import 'package:flutterapperadauti/modules/transport/screens/taxi/Taxi.dart';
import 'package:flutterapperadauti/modules/transport/screens/train/Train.dart';
import 'package:flutterapperadauti/modules/transport/screens/train/timeline.dart';
import 'package:flutterapperadauti/modules/usefull_numbers/local_authorities.dart';
import 'package:flutterapperadauti/modules/usefull_numbers/local_disturbance.dart';
import 'package:flutterapperadauti/modules/usefull_numbers/main_page.dart';
import 'package:flutterapperadauti/modules/usefull_numbers/public_institutions.dart';
import 'package:flutterapperadauti/modules/volunteer/volunteer.dart';
import 'package:flutterapperadauti/bindings/get_data_from_firebase_bindings.dart';
import 'package:get/route_manager.dart';

import '../modules/air_quality/screens/air_quality/air_quality_bindings.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: Routes.HOME,
        page: () => MenuScreen(),
        preventDuplicates: true,
        children: [
          GetPage(name: _Paths.SETTINGS, page: () => AppSettings(), children: [
            GetPage(name: _Paths.DEBUG, page: () => DebugSettings()),
          ]),
          GetPage(
            name: _Paths.ABOUT,
            page: () => AboutUsMain(),
          ),
          GetPage(
            name: _Paths.CONFIDENTIAL,
            page: () => Confidential(),
          ),
          GetPage(
            name: _Paths.PARTNER,
            page: () => Partner(),
          ),
          GetPage(
            name: _Paths.VOLUNTEER,
            page: () => VolunteerPage(),
          ),
          GetPage(
            name: _Paths.TRANSPORT,
            page: () => HomePageTransport(),
            children: [
              GetPage(
                name: _Paths.TAXI,
                page: () => Taxi(),
                bindings: [
                  GetDataFromFirebaseBindings(),
                  DownloadImageBindings(),
                ],
              ),
              GetPage(name: _Paths.BUS, page: () => Bus(), bindings: []),
              GetPage(
                name: _Paths.TRAIN,
                page: () => Train(),
                bindings: [
                  GetDataFromFirebaseBindings(),
                ],
                children: [
                  GetPage(
                    name: _Paths.TRAIN_TIMELINE,
                    page: () => TimelineRoute(),
                  ),
                ],
              ),
            ],
          ),
          GetPage(name: _Paths.AIR, page: () => AirQualityMain(), bindings: [
            AirQualityBindings(),
            GetDataFromFirebaseBindings(),
          ]),
          GetPage(
            name: _Paths.NOTICE_PROBLEM,
            page: () => MainNoticeUi(),
            bindings: [
              NoticeProblemFormBindings(),
            ],
            children: [
              GetPage(
                  name: _Paths.NOTICE_MAP,
                  page: () => NoticeMapUi(),
                  bindings: [GetDataFromFirebaseBindings()]),
            ],
            preventDuplicates: true,
          ),
          GetPage(
              name: _Paths.EVENTS,
              page: () => MainEventsScreen(),
              bindings: [
                GetDataFromFirebaseBindings(),
                EventsBindings(),
              ]),
          GetPage(
              name: _Paths.ANNOUNCEMENTS,
              page: () => Announcements(),
              children: [
                GetPage(
                    name: _Paths.LOCAL_ANNOUNCEMENTS,
                    page: () => LocalAnounnouncements(),
                    bindings: [
                      GetDataFromFirebaseBindings(),
                      DownloadImageBindings(),
                    ]),
                GetPage(
                  name: _Paths.JOBS,
                  page: () => JobPage(),
                  bindings: [
                    DownloadDataFromUrlBindings(),
                  ],
                ),
                GetPage(
                  name: _Paths.FURNITURE,
                  page: () => FurniturePage(),
                  bindings: [
                    DownloadDataFromUrlBindings(),
                  ],
                ),
              ]),
          GetPage(
              name: _Paths.TOWN_HALL,
              page: () => TownHallMain(),
              children: [
                GetPage(
                  name: _Paths.LEADERS,
                  page: () => Leaders(),
                  bindings: [GetDataFromFirebaseBindings()],
                ),
                GetPage(
                  name: _Paths.LOCAL_COUNCIL,
                  page: () => LocalCouncil(),
                  bindings: [GetDataFromFirebaseBindings()],
                ),
                GetPage(
                  name: _Paths.LOCAL_MEETINGS,
                  page: () => LocalMeetings(),
                  bindings: [GetDataFromFirebaseBindings()],
                ),
                GetPage(
                  name: _Paths.LOCAL_LEGISLATION,
                  page: () => LocalLegislation(),
                  bindings: [GetDataFromFirebaseBindings()],
                ),
              ]),
          GetPage(
              name: _Paths.PHONE_NUMBERS,
              page: () => HomePageNumbers(),
              children: [
                GetPage(
                  name: _Paths.LOCAL_AUTHORITIES,
                  page: () => LocalAuthorities(),
                  bindings: [GetDataFromFirebaseBindings()],
                ),
                GetPage(
                  name: _Paths.PUBLIC_INSTITUTIONS,
                  page: () => PublicInstitutions(),
                  bindings: [GetDataFromFirebaseBindings()],
                ),
                GetPage(
                  name: _Paths.LOCAL_DISTURBANCE,
                  page: () => LocalDisturbance(),
                  bindings: [GetDataFromFirebaseBindings()],
                ),
              ]),
        ]),
    GetPage(
        name: Routes.ONBOARD,
        page: () => Onboard(),
        bindings: [NotificationsSwitchBindings()]),
  ];
}
