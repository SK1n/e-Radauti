import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_model.g.dart';
part 'event_model.freezed.dart';

@freezed
class EventModel with _$EventModel {
  const factory EventModel({
    @JsonKey(defaultValue: []) required List<String> category,
    @JsonKey(defaultValue: '') required String description,
    @JsonKey(defaultValue: '') required String host,
    @JsonKey(defaultValue: '') required String imageUrl,
    @JsonKey(defaultValue: '') required String location,
    @JsonKey(defaultValue: '') required String title,
    @JsonKey(defaultValue: 0) required int startTimestamp,
    @JsonKey(defaultValue: 0) required int endTimestamp,
  }) = _EventModel;

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);
}
