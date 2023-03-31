import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'events_list_model.g.dart';

@JsonSerializable()
@Entity()
class EventsListModel {
  final String category;
  final String description;
  final String headline;
  final String location;
  final String host;
  final String street;
  final int start;
  final int end;
  @JsonKey(name: 'URL')
  final String url;
  @primaryKey
  final int id;

  const EventsListModel(
    this.category,
    this.description,
    this.headline,
    this.location,
    this.host,
    this.street,
    this.start,
    this.end,
    this.url,
    this.id,
  );

  factory EventsListModel.fromJson(Map<String, dynamic> json) =>
      _$EventsListModelFromJson(json);
  Map<String, dynamic> toJson() => _$EventsListModelToJson(this);
}
