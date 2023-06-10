import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'events_item_model.g.dart';

@JsonSerializable()
@Entity()
class EventsItemModel extends Equatable {
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
  final int? id;

  const EventsItemModel(
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

  factory EventsItemModel.fromJson(Map<String, dynamic> json) =>
      _$EventsItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$EventsItemModelToJson(this);

  @override
  List<Object?> get props => [
        category,
        description,
        headline,
        location,
        host,
        street,
        start,
        end,
        url,
        id
      ];
}
