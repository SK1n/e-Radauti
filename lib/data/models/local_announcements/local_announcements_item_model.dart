import 'package:json_annotation/json_annotation.dart';

part 'local_announcements_item_model.g.dart';

@JsonSerializable()
class LocalAnnouncementsItemModel {
  @JsonKey(name: 'URL')
  final String? url;
  @JsonKey(name: 'date')
  final String? date;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'host')
  final String? host;
  @JsonKey(name: 'title')
  final String? title;

  const LocalAnnouncementsItemModel(
      this.url, this.date, this.description, this.host, this.title);

  factory LocalAnnouncementsItemModel.fromJson(Map<String, dynamic> json) =>
      _$LocalAnnouncementsItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocalAnnouncementsItemModelToJson(this);
}
