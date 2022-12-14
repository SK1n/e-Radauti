import 'package:flutterapperadauti/data/models/events/events_list_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'old_events_model.g.dart';

@JsonSerializable()
class OldEventsModel {
  @JsonKey(name: 'oldEvents')
  final List<EventsListModel>? events;

  const OldEventsModel({this.events});

  factory OldEventsModel.fromJson(Map<String, dynamic> json) =>
      _$OldEventsModelFromJson(json);
  Map<String, dynamic> toJson() => _$OldEventsModelToJson(this);
}
