import 'package:json_annotation/json_annotation.dart';

part 'events_list_model.g.dart';

@JsonSerializable()
class EventsListModel {
  String? category;
  String? description;
  String? headline;
  String? location;
  String? host;
  String? street;
  num? start;
  num? end;
  @JsonKey(name: 'URL')
  String? url;

  EventsListModel({
    this.category,
    this.description,
    this.headline,
    this.location,
    this.host,
    this.street,
    this.start,
    this.end,
  });

  factory EventsListModel.fromJson(Map<String, dynamic> json) =>
      _$EventsListModelFromJson(json);
  Map<String, dynamic> toJson() => _$EventsListModelToJson(this);
}
