import 'package:json_annotation/json_annotation.dart';

part 'local_meetings_item_model.g.dart';

@JsonSerializable()
class LocalMeetingsItemModel {
  @JsonKey(name: 'URL')
  final String? fbLink;
  @JsonKey(name: 'theagend')
  final String? pdfLink;
  final String? date;

  const LocalMeetingsItemModel(this.fbLink, this.pdfLink, this.date);

  factory LocalMeetingsItemModel.fromJson(Map<String, dynamic> json) =>
      _$LocalMeetingsItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocalMeetingsItemModelToJson(this);
}
