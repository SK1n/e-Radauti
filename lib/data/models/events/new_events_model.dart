import 'package:flutterapperadauti/data/models/events/events_item_model2.dart';
import 'package:json_annotation/json_annotation.dart';

part 'new_events_model.g.dart';

@JsonSerializable()
class NewEventsModel {
  @JsonKey(name: 'events')
  final List<EventsItemModel2> events;

  const NewEventsModel(this.events);

  factory NewEventsModel.fromJson(Map<String, dynamic> json) =>
      _$NewEventsModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewEventsModelToJson(this);
}
