import 'package:flutterapperadauti/data/models/local_meetings/local_meetings_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'local_meetings_model.g.dart';

@JsonSerializable()
class LocalMeetingsModel {
  @JsonKey(name: 'meetings')
  final List<LocalMeetingsItemModel> items;

  const LocalMeetingsModel(this.items);

  factory LocalMeetingsModel.fromJson(Map<String, dynamic> json) =>
      _$LocalMeetingsModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocalMeetingsModelToJson(this);
}
