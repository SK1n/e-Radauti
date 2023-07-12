import '../../../models/events/events_item_model.dart';
import '../../../utils/extensions/timestamp_to_date.dart';
import '../../../../gen/strings.g.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/widgets/image_widget.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'event_details_page.dart';

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
        padding: const EdgeInsets.only(top: 20),
        child: Card(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black12, width: 0),
            borderRadius: BorderRadius.circular(30),
          ),
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
                            padding: const EdgeInsets.only(left: 20),
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
                            padding: const EdgeInsets.only(left: 20),
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
