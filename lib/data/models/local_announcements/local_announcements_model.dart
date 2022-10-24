import 'package:flutterapperadauti/data/models/local_announcements/local_announcements_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'local_announcements_model.g.dart';

@JsonSerializable()
class LocalAnnouncementsModel {
  @JsonKey(name: 'announcement')
  final List<LocalAnnouncementsItemModel>? items;

  const LocalAnnouncementsModel(this.items);

  factory LocalAnnouncementsModel.fromJson(Map<String, dynamic> json) =>
      _$LocalAnnouncementsModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocalAnnouncementsModelToJson(this);
}
