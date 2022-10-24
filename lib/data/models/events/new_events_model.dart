import 'package:flutterapperadauti/data/models/events/events_list_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'new_events_model.g.dart';

@JsonSerializable()
class NewEventsModel {
  final List<EventsListModel>? events;

  const NewEventsModel({this.events});

  factory NewEventsModel.fromJson(Map<String, dynamic> json) =>
      _$NewEventsModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewEventsModelToJson(this);
}
