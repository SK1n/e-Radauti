import 'package:floor/floor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'events_item_model.freezed.dart';
part 'events_item_model.g.dart';

@freezed
class EventsItemModel with _$EventsItemModel {
  @JsonSerializable(explicitToJson: true)
  const factory EventsItemModel({
    required String category,
    required String description,
    required String headline,
    required String location,
    required String host,
    required String street,
    required int start,
    required int end,
    int? id,
    @JsonKey(name: 'URL') required String url,
  }) = _EventsItemModel;

  factory EventsItemModel.fromJson(Map<String, dynamic> json) =>
      _$EventsItemModelFromJson(json);
}
