import 'package:firestore_repository/firestore_repository.dart';
import 'package:flutterapperadauti/app/i18n/strings.g.dart';
import 'package:flutterapperadauti/utils/const.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutterapperadauti/utils/shared_widgets/image_widget.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'event_details_page.dart';

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

class ItemEvent extends StatelessWidget {
  final EventsItemModel data;
  const ItemEvent(
    this.data, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        EventDetailsPage.route(data),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: topMargin),
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
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    child: ImageWidget(
                      link: data.url,
                      fit: BoxFit.cover,
                    ),
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
                            padding: const EdgeInsets.only(left: leftMargin),
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
                            padding: const EdgeInsets.only(left: leftMargin),
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
                    onPressed: () => Navigator.of(context).push(
                      EventDetailsPage.route(data),
                    ),
                    child: Text(t.events.seeDetails),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
