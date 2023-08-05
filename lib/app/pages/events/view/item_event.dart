import 'package:flutterapperadauti/app/utils/app_constants.dart';

import '../../../models/events/events_item_model.dart';
import '../../../utils/extensions/timestamp_to_date.dart';
import '../../../../gen/strings.g.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

import '../../../utils/widgets/image_widget.dart';
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
        padding: AppConstants.topDelimiter,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 200,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: AppConstants.cardRadius,
                    topRight: AppConstants.cardRadius,
                  ),
                  child: ImageWidget(
                    link: data.url,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: AppConstants.innerCardPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.headline,
                      style: AppConstants.titleBigTextStyle,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          FontAwesome5.calendar_alt,
                        ),
                        Padding(
                          padding: AppConstants.leftDelimiter,
                          child: Text(
                            data.start.getDate,
                            style: AppConstants.textTextStyle,
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          FontAwesome5.clock,
                        ),
                        Padding(
                          padding: AppConstants.leftDelimiter,
                          child: Text(
                            data.start.getHour,
                            style: AppConstants.textTextStyle,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: AppConstants.innerCardPadding,
                child: FilledButton(
                  onPressed: () => Navigator.of(context).push(
                    EventDetailsPage.route(data),
                  ),
                  child: Text(
                    context.t.events.seeDetails,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
