import 'package:freezed_annotation/freezed_annotation.dart';

part 'events_item_model.freezed.dart';
part 'events_item_model.g.dart';

@freezed
class EventsItemModel with _$EventsItemModel {
  const factory EventsItemModel({
    @JsonKey(name: 'category', defaultValue: '') required String category,
    @JsonKey(name: 'description', defaultValue: '') required String description,
    @JsonKey(name: 'headline', defaultValue: '') required String headline,
    @JsonKey(name: 'location', defaultValue: '') required String location,
    @JsonKey(name: 'URL', defaultValue: '') required String url,
    @JsonKey(name: 'host', defaultValue: '') required String host,
    @JsonKey(name: 'street', defaultValue: '') required String street,
    @JsonKey(name: 'start', defaultValue: 0) required int start,
    @JsonKey(name: 'end', defaultValue: 0) required int end,
    @JsonKey(name: 'id', defaultValue: 0) required int id,
  }) = _EventsItemModel;

  factory EventsItemModel.fromJson(Map<String, dynamic> json) =>
      _$EventsItemModelFromJson(json);
}
