import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutterapperadauti/controllers/dao_controller.dart';
import 'package:flutterapperadauti/dao/app_database.dart';
import 'package:flutterapperadauti/data/models/events/events_item_model.dart';
import 'package:flutterapperadauti/modules/events/controllers/favorites_events_controller.dart';
import 'package:flutterapperadauti/modules/events/controllers/new_events_controller.dart';
import 'package:flutterapperadauti/utils/const.dart';
import 'package:flutterapperadauti/utils/helpers/launch_url_helper.dart';
import 'package:flutterapperadauti/utils/shared_widgets/custom_page_scaffold.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:flutterapperadauti/utils/shared_widgets/image_widget.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:selectable_autolink_text/selectable_autolink_text.dart';

extension Timestamp on num {
  String get date {
    DateFormat format = DateFormat('dd MMMM yyyy • HH:mm', 'ro');
    return format
        .format(DateTime.fromMillisecondsSinceEpoch(toInt() * 1000))
        .toUpperCase();
  }
}

class EventsDetails extends StatefulWidget with UrlLauncher {
  const EventsDetails({super.key});

  @override
  State<EventsDetails> createState() => _EventsDetailsState();
}

class _EventsDetailsState extends State<EventsDetails> with UrlLauncher {
  final DaoController daoController = Get.find();
  final EventsItemModel data = Get.arguments[0];
  bool eventExists = false;
  @override
  void initState() {
    checkIfEventIsFavorite();
    super.initState();
  }

  Future<void> checkIfEventIsFavorite() async {
    if (await daoController.eventExists(data, data.id!) ?? false) {
      eventExists = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final DaoController daoController = Get.find();
    final FavoritesEventsController controller = Get.find();
    return CustomPageScaffold(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 300,
                  child: ImageWidget(
                    link: data.url,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: topMargin),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Elusive.location,
                              size: 14,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: leftMargin),
                              child: Text(
                                '${data.location}\n${data.street}',
                                style: GoogleFonts.roboto(fontSize: 14),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: topMargin),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              FontAwesome5.calendar_alt,
                              size: 14,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: leftMargin),
                              child: Text(
                                '${"start-date".tr}: ${data.start.date}',
                                style: GoogleFonts.roboto(fontSize: 14),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: topMargin),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              FontAwesome5.calendar_alt,
                              size: 14,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: leftMargin),
                              child: Text(
                                '${"end-date".tr}: ${data.end.date}',
                                style: GoogleFonts.roboto(fontSize: 14),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: topMargin),
                        child: Visibility(
                          replacement: FilledButton.icon(
                            icon: const Icon(
                              FontAwesome5.star,
                              size: 14,
                            ),
                            label: Text('remove-event'.tr),
                            onPressed: () async {
                              await daoController.remove(data);
                              eventExists = false;
                              controller.getFavoritesEvents();
                              setState(() {});
                            },
                          ),
                          visible: !eventExists,
                          child: FilledButton.icon(
                            icon: const Icon(
                              FontAwesome5.star,
                              size: 14,
                            ),
                            label: Text('save-event'.tr),
                            onPressed: () async {
                              await daoController.insert(data);
                              eventExists = true;
                              controller.getFavoritesEvents();
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: topMargin),
                        child: SelectableAutoLinkText(
                          data.description,
                          onTransformDisplayLink: AutoLinkUtils.shrinkUrl,
                          linkStyle: const TextStyle(color: Colors.pinkAccent),
                          onTap: (link) async {
                            await launchUrlS(link);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
      navBarMiddle: data.headline,
    );
  }
}
