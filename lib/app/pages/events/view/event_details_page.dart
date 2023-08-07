import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/models/events/event_model.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
import 'package:flutterapperadauti/app/utils/extensions/timestamp_to_date.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../bloc/events_bloc.dart';
import '../../../repository/authentication/authentication_repository.dart';
import '../../../repository/firestore/firestore_repository.dart';
import '../../../repository/storage/storage_repository.dart';
import '../../../utils/scaffolds/app_scaffold.dart';
import '../../../utils/widgets/image_widget.dart';
import '../../../../gen/strings.g.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

import 'package:selectable_autolink_text/selectable_autolink_text.dart';

class EventDetailsPage extends StatelessWidget {
  const EventDetailsPage({super.key, required this.event});

  final EventModel event;

  static Route<void> route(EventModel event) {
    return MaterialPageRoute<void>(
        builder: (_) => EventDetailsPage(event: event));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EventsBloc>(
      create: (context) => EventsBloc(
        context.read<FirestoreRepository>(),
        context.read<StorageRepository>(),
        context.read<AuthenticationRepository>(),
      )..add(const GetFavoriteEvents()),
      child: AppScaffold(appBarTitle: event.title, slivers: [
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300,
                child: ImageWidget(
                  link: event.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: AppConstants.innerCardPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Elusive.location,
                          size: 14,
                        ),
                        Padding(
                          padding: AppConstants.leftDelimiter,
                          child: Text(
                            event.location,
                            style: AppConstants.titleBigTextStyle,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: AppConstants.topDelimiter,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            FontAwesome5.calendar_alt,
                            size: 14,
                          ),
                          Padding(
                            padding: AppConstants.leftDelimiter,
                            child: Text(
                              context.t.events.startDate(
                                  date:
                                      "${event.startTimestamp.getDate} - ${event.startTimestamp.getHour}"),
                              style: AppConstants.textTextStyle,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: AppConstants.topDelimiter,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            FontAwesome5.calendar_alt,
                            size: 14,
                          ),
                          Padding(
                            padding: AppConstants.leftDelimiter,
                            child: Text(
                              context.t.events.endDate(
                                date:
                                    "${event.endTimestamp.getDate} - ${event.endTimestamp.getHour}",
                              ),
                              style: AppConstants.textTextStyle,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: AppConstants.topDelimiter,
                      child: BlocConsumer<EventsBloc, EventsState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          bool isFavorite =
                              state.favoriteEvents.contains(event);
                          return FilledButton.icon(
                            icon: Icon(
                              FontAwesome5.star,
                              color: isFavorite ? Colors.yellow : Colors.white,
                              size: 14,
                            ),
                            label: Text(
                              isFavorite
                                  ? context.t.events.removeFromFavorites
                                  : context.t.events.addToFavorites,
                            ),
                            onPressed: () async {
                              if (!isFavorite) {
                                context
                                    .read<EventsBloc>()
                                    .add(AddToFavorite(event));
                              } else {
                                context
                                    .read<EventsBloc>()
                                    .add(RemoveFromFavorite(event));
                              }
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: AppConstants.topDelimiter,
                      child: SelectableAutoLinkText(
                        event.description,
                        style: AppConstants.smallTextTextStyle,
                        onTransformDisplayLink: AutoLinkUtils.shrinkUrl,
                        linkStyle: AppConstants.linkTextStyle,
                        onTap: (link) async {
                          if (await canLaunchUrlString(link)) {
                            await launchUrlString(link);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
