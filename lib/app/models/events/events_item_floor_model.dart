import 'package:floor/floor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'events_item_floor_model.g.dart';

@JsonSerializable()
@Entity()
class EventsItemFloorModel {
  final String category;
  final String description;
  final String headline;
  final String location;
  final String host;

  final String street;
  final int start;
  final int end;
  @JsonKey(name: 'URL')
  String url;
  @primaryKey
  final int? id;

  EventsItemFloorModel(
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

  factory EventsItemFloorModel.fromJson(Map<String, dynamic> json) =>
      _$EventsItemFloorModelFromJson(json);
  Map<String, dynamic> toJson() => _$EventsItemFloorModelToJson(this);
}
