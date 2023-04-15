import 'package:flutterapperadauti/bindings/account_bindings.dart';
import 'package:flutterapperadauti/middlewares/auth_middleware.dart';
import 'package:flutterapperadauti/modules/account/views/account_page.dart';
import 'package:flutterapperadauti/modules/account/views/update_name_page.dart';
import 'package:flutterapperadauti/modules/account/views/update_password_page.dart';
import 'package:flutterapperadauti/modules/air_quality/bindings/air_quality_bindings.dart';
import 'package:flutterapperadauti/modules/announcements/bindings/get_e_radauti_data_bindings.dart';
import 'package:flutterapperadauti/modules/announcements/views/local_announcements_page.dart';
import 'package:flutterapperadauti/modules/events/bindings/events_bindings.dart';
import 'package:flutterapperadauti/bindings/notifications_switch_bindings.dart';
import 'package:flutterapperadauti/modules/air_quality/views/air_quality_page.dart';
import 'package:flutterapperadauti/modules/announcements/views/announcements_page.dart';
import 'package:flutterapperadauti/modules/announcements/views/furniture_page.dart';
import 'package:flutterapperadauti/modules/announcements/views/job_page.dart';
import 'package:flutterapperadauti/modules/events/views/events_page.dart';
import 'package:flutterapperadauti/modules/account/bindings/reset_password_bindings.dart';
import 'package:flutterapperadauti/modules/account/bindings/sign_in_bindings.dart';
import 'package:flutterapperadauti/modules/account/bindings/sign_up_bindings.dart';
import 'package:flutterapperadauti/modules/login/views/login_page.dart';
import 'package:flutterapperadauti/modules/account/views/reset_password_page.dart';
import 'package:flutterapperadauti/modules/account/views/sign_up_page.dart';
import 'package:flutterapperadauti/modules/home/bindings/home_page_binding.dart';
import 'package:flutterapperadauti/modules/home/views/menu_screen.dart';
import 'package:flutterapperadauti/modules/onboard/bindings/onboard_bindings.dart';
import 'package:flutterapperadauti/modules/onboard/views/permissions_page.dart';
import 'package:flutterapperadauti/modules/report_a_problem/bindings/form_binding.dart';
import 'package:flutterapperadauti/modules/report_a_problem/views/report_problem_page.dart';
import 'package:flutterapperadauti/modules/report_a_problem/bindings/notice_problem_map_bindings.dart';
import 'package:flutterapperadauti/modules/onboard/views/onboard_page.dart';
import 'package:flutterapperadauti/modules/screens/views/about_us_page.dart';
import 'package:flutterapperadauti/modules/screens/views/confidential_page.dart';
import 'package:flutterapperadauti/modules/screens/views/partner_page.dart';
import 'package:flutterapperadauti/modules/settings/views/app_settings.dart';
import 'package:flutterapperadauti/modules/settings/views/debug_settings.dart';
import 'package:flutterapperadauti/modules/town_hall/bindings/local_legislation_bindings.dart';
import 'package:flutterapperadauti/modules/town_hall/views/leaders_page.dart';
import 'package:flutterapperadauti/modules/town_hall/views/local_legislation_page.dart';
import 'package:flutterapperadauti/modules/town_hall/views/local_council_page.dart';
import 'package:flutterapperadauti/modules/town_hall/views/local_meetings_page.dart';
import 'package:flutterapperadauti/modules/town_hall/views/town_hall_page.dart';
import 'package:flutterapperadauti/modules/transport/views/transport_page.dart';
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
  static const String initial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.signIn,
      page: () => const LoginPage(),
      middlewares: [
        AuthMiddleware(),
      ],
      bindings: [
        SignInBinding(),
      ],
      children: [
        GetPage(
          name: _Paths.signUp,
          page: () => const SignUpPage(),
          bindings: [
            SignUpBinding(),
          ],
        ),
        GetPage(
          name: _Paths.resetPassword,
          page: () => const ResetPasswordPage(),
          bindings: [
            ResetPasswordBinding(),
          ],
        ),
      ],
    ),
    GetPage(
        name: Routes.home,
        page: () => const MenuScreen(),
        preventDuplicates: true,
        bindings: [
          HomePageBinding(),
        ],
        children: [
          GetPage(
              name: _Paths.account,
              page: () => const AccountPage(),
              bindings: [
                AccountBinding(),
              ],
              children: [
                GetPage(
                  name: _Paths.updateName,
                  page: () => const UpdateNamePage(),
                  bindings: [
                    AccountBinding(),
                  ],
                ),
                GetPage(
                  name: _Paths.updatePassword,
                  page: () => const UpdatePasswordPage(),
                  bindings: [
                    AccountBinding(),
                  ],
                ),
              ]),
          GetPage(
            name: _Paths.settings,
            page: () => const AppSettings(),
            bindings: [
              NotificationsSwitchBindings(),
            ],
            children: [
              GetPage(name: _Paths.debug, page: () => const DebugSettings()),
            ],
          ),
          GetPage(
            name: _Paths.about,
            page: () => const AboutUsPage(),
          ),
          GetPage(
            name: _Paths.confidential,
            page: () => const Confidential(),
          ),
          GetPage(
            name: _Paths.partner,
            page: () => const PartnerPage(),
          ),
          GetPage(
            name: _Paths.volunteer,
            page: () => const VolunteerPage(),
          ),
          GetPage(
            name: _Paths.transport,
            page: () => const TransportPage(),
            children: [
              GetPage(
                name: _Paths.taxi,
                page: () => const TaxiPage(),
              ),
              GetPage(
                name: _Paths.train,
                page: () => const TrainPage(),
                children: [
                  GetPage(
                    name: _Paths.trainTimeline,
                    page: () => const TimelineRoute(),
                  ),
                ],
              ),
            ],
          ),
          GetPage(
              name: _Paths.air,
              page: () => const AirQualityPage(),
              bindings: [
                AirQualityBindings(),
              ]),
          GetPage(
            name: _Paths.reportProblem,
            page: () => const ReportProblemPage(),
            bindings: [
              NoticeProblemFormBindings(),
              NoticeProblemMapBinding(),
              AccountBinding()
            ],
            preventDuplicates: true,
          ),
          GetPage(
              name: _Paths.events,
              page: () => const EventsPage(),
              bindings: [
                EventsBindings(),
              ]),
          GetPage(
              name: _Paths.announcements,
              page: () => const AnnouncementsPage(),
              children: [
                GetPage(
                  name: _Paths.jobs,
                  page: () => const JobPage(),
                  bindings: [
                    GetERadautiDataBinding(),
                  ],
                ),
                GetPage(
                  name: _Paths.localAnnouncements,
                  page: () => const LocalAnnouncementsPage(),
                ),
                GetPage(
                  name: _Paths.furniture,
                  page: () => const FurniturePage(),
                  bindings: [
                    GetERadautiDataBinding(),
                  ],
                ),
              ]),
          GetPage(
              name: _Paths.townHall,
              page: () => const TownHallMain(),
              children: [
                GetPage(
                  name: _Paths.leaders,
                  page: () => const LeadersPage(),
                ),
                GetPage(
                  name: _Paths.localCouncil,
                  page: () => const LocalCouncilPage(),
                ),
                GetPage(
                  name: _Paths.localMeetings,
                  page: () => const LocalMeetingsPage(),
                ),
                GetPage(
                  name: _Paths.localLegislation,
                  page: () => const LocalLegislationPage(),
                  binding: LocalLegislationBinding(),
                ),
              ]),
          GetPage(
              name: _Paths.phoneNumberrs,
              page: () => const UsefullNumbersPage(),
              children: [
                GetPage(
                  name: _Paths.localAuthorities,
                  page: () => const LocalAuthoritiesPage(),
                ),
                GetPage(
                  name: _Paths.publicInstitutions,
                  page: () => const PublicInstitutionsPage(),
                ),
                GetPage(
                  name: _Paths.localDisturbances,
                  page: () => const LocalDisturbancePage(),
                ),
              ]),
        ]),
    GetPage(name: Routes.onboard, page: () => const OnboardPage(), children: [
      GetPage(
        name: _Paths.permissionsPage,
        page: () => const PermissionsPage(),
      ),
    ], bindings: [
      NotificationsSwitchBindings(),
      OnboardBinding()
    ]),
  ];
}
