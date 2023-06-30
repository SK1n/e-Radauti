import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/models/events/events_item_model.dart';
import 'package:flutterapperadauti/app/pages/events/cubit/event_details_cubit.dart';
import 'package:flutterapperadauti/app/repository/floor/floor_repository.dart';
import 'package:flutterapperadauti/i18n/strings.g.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_scaffold/app_scaffold.dart';
import 'package:flutterapperadauti/utils/shared_widgets/image_widget.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:selectable_autolink_text/selectable_autolink_text.dart';

extension on num {
  String get date {
    DateFormat format = DateFormat('dd MMMM yyyy • HH:mm', 'ro');
    return format
        .format(DateTime.fromMillisecondsSinceEpoch(toInt() * 1000))
        .toUpperCase();
  }
}

class EventDetailsPage extends StatelessWidget {
  const EventDetailsPage({super.key, required this.event});

  final EventsItemModel event;

  static Route<void> route(EventsItemModel event) {
    return MaterialPageRoute<void>(
        builder: (_) => EventDetailsPage(event: event));
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(appBarTitle: event.headline, slivers: [
      BlocProvider(
        create: (context) => EventDetailsCubit(context.read<FloorRepository>())
          ..isFavoriteChanged(
            event.id!,
          ),
        child: BlocListener<EventDetailsCubit, EventDetailsState>(
          listener: (context, state) {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300,
                child: ImageWidget(
                  link: event.url,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Elusive.location,
                            size: 14,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              '${event.location}\n${event.street}',
                              style: GoogleFonts.roboto(fontSize: 14),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            FontAwesome5.calendar_alt,
                            size: 14,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              t.events.startDate(date: event.start.date),
                              style: GoogleFonts.roboto(fontSize: 14),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            FontAwesome5.calendar_alt,
                            size: 14,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              t.events.endDate(date: event.end.date),
                              style: GoogleFonts.roboto(fontSize: 14),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: BlocSelector<EventDetailsCubit, EventDetailsState,
                          bool>(
                        selector: (state) {
                          return state.isFavorite;
                        },
                        builder: (context, isFavorite) {
                          return FilledButton.icon(
                            icon: Icon(
                              FontAwesome5.star,
                              color: isFavorite ? Colors.yellow : Colors.white,
                              size: 14,
                            ),
                            label: Text(
                              isFavorite
                                  ? t.events.removeFromFavorites
                                  : t.events.addToFavorites,
                            ),
                            onPressed: () async {
                              context
                                  .read<EventDetailsCubit>()
                                  .toggleIsFavorite(event);
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SelectableAutoLinkText(
                        event.description,
                        onTransformDisplayLink: AutoLinkUtils.shrinkUrl,
                        linkStyle: const TextStyle(color: Colors.pinkAccent),
                        onTap: (link) async {
                          // await launchUrlS(link);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
