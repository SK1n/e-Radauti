import 'package:json_annotation/json_annotation.dart';

part 'local_announcements_item_model.g.dart';

@JsonSerializable()
class LocalAnnouncementsItemModel {
  @JsonKey(name: 'URL')
  String url;
  @JsonKey(name: 'date')
  final String? date;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'host')
  final String? host;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'author')
  final String? author;
  @JsonKey(name: "author_email")
  final String? authorEmail;

  LocalAnnouncementsItemModel(
    this.url,
    this.date,
    this.description,
    this.host,
    this.title,
    this.author,
    this.authorEmail,
  );

  factory LocalAnnouncementsItemModel.fromJson(Map<String, dynamic> json) =>
      _$LocalAnnouncementsItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocalAnnouncementsItemModelToJson(this);
}
