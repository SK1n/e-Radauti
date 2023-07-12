import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
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
      case 'events':
        return Navigator.of(context).push(EventsPage.route());
      case 'report_problem':
        return Navigator.of(context).push(ReportProblemPage.route());
      case 'air_quality':
        return Navigator.of(context).push(AirQualityPage.route());
      case 'local_administation':
        return Navigator.of(context).push(PageLocalAdministration.route());
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
      )
        ..getLatestDecision()
        ..getNextEvent()
        ..isUserAnnonymous(),
      child: AppScaffold(
        appBarTitle: 'e-Radauti',
        slivers: [
          BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              return SizedBox(
                height: 180,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () =>
                            Navigator.of(context).push(AirQualityPage.route()),
                        child: Card(
                          child: InAppWebView(
                            initialOptions: InAppWebViewGroupOptions(
                              android: AndroidInAppWebViewOptions(
                                  builtInZoomControls: false,
                                  fixedFontFamily: "inter",
                                  displayZoomControls: false,
                                  initialScale: 1,
                                  overScrollMode:
                                      AndroidOverScrollMode.OVER_SCROLL_NEVER),
                              ios: IOSInAppWebViewOptions(
                                enableViewportScale: false,
                              ),
                            ),
                            initialUrlRequest: URLRequest(
                              url: Uri.parse(
                                  'https://calitateaer.radautiulcivic.ro/wp-content/uploads/2023/07/Calitatea_aerului_e-Radauti_Widget_home.html'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    state.isAnnonymous
                        ? Container()
                        : Expanded(
                            child: GestureDetector(
                              onTap: () => Navigator.of(context)
                                  .push(ReportProblemPage.route()),
                              child: Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: RichText(
                                            text: TextSpan(
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                // fontWeight: FontWeight.bold,
                                              ),
                                              children: [
                                                const TextSpan(
                                                  text: 'Aveti\n\n',
                                                ),
                                                TextSpan(
                                                  text: state.numsOfReports
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 40,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const TextSpan(
                                                  text: '\n\nsesizari facute',
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
                    text: t.home.newEvents,
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
