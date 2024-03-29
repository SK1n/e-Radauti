import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutterapperadauti/app/pages/announcements/view/page_announcements.dart';
import 'package:flutterapperadauti/app/repository/authentication/authentication_repository.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
import '../../air_quality/view/air_quality_page.dart';
import '../../events/view/events_page.dart';
import '../../events/view/item_event.dart';
import '../cubit/home_cubit.dart';
import '../../local_administration/item_local_decision.dart';
import '../../local_administration/page_local_administration.dart';
import '../../report_problem/view/report_problem_page.dart';
import '../../../repository/firestore/firestore_repository.dart';
import '../../../repository/local_administration/local_administration_repository.dart';
import '../../../repository/storage/storage_repository.dart';
import '../../../utils/page_state.dart';
import '../../../../gen/strings.g.dart';
import '../../../utils/widgets/loading_widget.dart';
import '../../../utils/scaffolds/app_scaffold.dart';
import '../../../utils/widgets/empty_widget.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});
  static Page<void> page() =>
      const MaterialPage<void>(child: PageHome(), name: '/home');

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  void initState() {
    String route = '';
    FirebaseMessaging.instance.getInitialMessage().then((value) {
      route = value?.data['view'] ?? '';
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _goToRoute(route);
    });

    super.initState();
  }

  _goToRoute(String route) {
    switch (route) {
      case AppConstants.eventsTopicKey:
        return Navigator.of(context).push(EventsPage.route());
      case AppConstants.reportProblemTopicKey:
        return Navigator.of(context).push(ReportProblemPage.route());
      case AppConstants.airQualityTopicKey:
        return Navigator.of(context).push(AirQualityPage.route());
      case AppConstants.announcementsTopicKey:
        return Navigator.of(context).push(PageAnnouncements.route());
      default:
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(
        firestoreRepository: context.read<FirestoreRepository>(),
        localAdministrationRepository:
            context.read<LocalAdministrationRepository>(),
        storageRepository: context.read<StorageRepository>(),
        authenticationRepository: context.read<AuthenticationRepository>(),
      ),
      child: AppScaffold(
        appBarTitle: 'e-Radauti',
        slivers: [
          BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              return SizedBox(
                height: 250,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () =>
                            Navigator.of(context).push(AirQualityPage.route()),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Colors.black12, width: 0),
                            borderRadius: AppConstants.borderRadius,
                          ),
                          child: ClipRRect(
                            borderRadius: AppConstants.borderRadius,
                            child: InAppWebView(
                              initialOptions: InAppWebViewGroupOptions(
                                android: AndroidInAppWebViewOptions(
                                    builtInZoomControls: false,
                                    fixedFontFamily: "inter",
                                    displayZoomControls: false,
                                    initialScale: 1,
                                    overScrollMode: AndroidOverScrollMode
                                        .OVER_SCROLL_NEVER),
                                ios: IOSInAppWebViewOptions(
                                  enableViewportScale: false,
                                ),
                              ),
                              initialUrlRequest: URLRequest(
                                url: Uri.parse(
                                  AppConstants.airQualityWidgetLink,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    state.isAnnonymous
                        ? Container()
                        : BlocConsumer<HomeCubit, HomeState>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              return Expanded(
                                child: GestureDetector(
                                  onTap: () => Navigator.of(context)
                                      .push(ReportProblemPage.route()),
                                  child: Card(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                AppConstants.innerCardPadding,
                                            child: Center(
                                              child: RichText(
                                                text: TextSpan(
                                                  style: AppConstants
                                                      .titleBigTextStyle,
                                                  children: [
                                                    TextSpan(
                                                      text: context
                                                          .t.home.reportsMade1,
                                                    ),
                                                    TextSpan(
                                                      text: state.numsOfReports
                                                          .toString(),
                                                      style: const TextStyle(
                                                        fontSize: 40,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: context
                                                          .t.home.reportsMade2,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                  ],
                ),
              );
            },
          ),
          InkWell(
            onTap: () =>
                Navigator.of(context).push(PageLocalAdministration.route()),
            child: BlocConsumer<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state.dmState.isInProgress) {
                  return const LoadingWidget();
                } else if (state.dmState.isFalure) {
                  return Container();
                } else if (state.dmData == null) {
                  return Container();
                } else {
                  return ItemLocalDecision(
                    item: state.dmData!,
                  );
                }
              },
              listener: (context, state) {},
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).push(EventsPage.route()),
            child: BlocConsumer<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state.eventState.isInProgress) {
                  return const LoadingWidget();
                } else if (state.eventState.isFalure) {
                  return EmptyWidget(
                    text: context.t.home.newEvents,
                  );
                } else if (state.eventData == null) {
                  return Container();
                } else {
                  return ItemEvent(state.eventData!);
                }
              },
              listener: (context, state) {},
            ),
          ),
        ],
      ),
    );
  }
}
