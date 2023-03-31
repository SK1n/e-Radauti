import 'package:card_loading/card_loading.dart';
import 'package:flutterapperadauti/data/models/events/events_list_model.dart';
import 'package:flutterapperadauti/modules/events/controllers/events_controller.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/const.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutterapperadauti/utils/helpers/get_image_url.dart';
import 'package:flutterapperadauti/utils/shared_widgets/image_widget.dart';
import 'package:get/get.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension TimestampToDate on num {
  String get getDate {
    DateFormat format = DateFormat('dd MMMM yyyy', 'ro');
    return format
        .format(DateTime.fromMillisecondsSinceEpoch(toInt() * 1000))
        .toUpperCase();
  }

  String get getHour {
    DateFormat format = DateFormat('HH:mm', 'ro');
    return format
        .format(DateTime.fromMillisecondsSinceEpoch(toInt() * 1000))
        .toUpperCase();
  }
}

class EventsItemWidget extends StatelessWidget with GetImageUrl {
  final EventsListModel data;
  const EventsItemWidget(
    this.data, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final EventsController eventsNewController = Get.find();
    return Futuristic(
      initialBuilder: (_, __) => Container(),
      futureBuilder: () => getImageUrl(data.url),
      busyBuilder: (_) {
        return const CardLoading(
          height: 300,
          margin: EdgeInsets.only(bottom: 20),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        );
      },
      dataBuilder: (_, snapshot) {
        return Padding(
          padding: const EdgeInsets.only(top: topMargin),
          child: InkWell(
            onTap: () => Get.toNamed(
              Routes.eventsDetails,
              arguments: [
                data,
                snapshot,
              ],
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.black12, width: 1),
                borderRadius: BorderRadius.circular(30),
              ),
              color: Colors.white,
              child: SizedBox(
                width: Get.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 200,
                      child: ImageWidget(
                        link: snapshot,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.headline,
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                FontAwesome5.calendar_alt,
                                size: 14,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: leftMargin),
                                child: Text(
                                  data.start.getDate,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                FontAwesome5.clock,
                                size: 14,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: leftMargin),
                                child: Text(
                                  data.start.getHour,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, bottom: 10),
                      child: FilledButton(
                        onPressed: () => Get.toNamed(
                          Routes.eventsDetails,
                          arguments: [
                            data,
                            snapshot,
                          ],
                        ),
                        child: Text(
                          'see-details'.tr,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
