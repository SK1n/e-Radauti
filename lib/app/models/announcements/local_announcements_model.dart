import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_announcements_model.freezed.dart';
part 'local_announcements_model.g.dart';

@freezed
class LocalAnnouncementsModel with _$LocalAnnouncementsModel {
  const factory LocalAnnouncementsModel({
    @JsonKey(name: 'announcements', defaultValue: [])
    required List<LocalAnnouncementsItemModel> items,
  }) = _LocalAnnouncementsModel;

  factory LocalAnnouncementsModel.fromJson(Map<String, dynamic> json) =>
      _$LocalAnnouncementsModelFromJson(json);
}

@freezed
class LocalAnnouncementsItemModel with _$LocalAnnouncementsItemModel {
  const factory LocalAnnouncementsItemModel({
    @JsonKey(name: 'title', defaultValue: '') required String title,
    @JsonKey(name: 'url', defaultValue: '') required String image,
    @JsonKey(name: 'description', defaultValue: '') required String description,
    @JsonKey(name: 'date_created', defaultValue: 0) required int dateCreated,
  }) = _LocalAnnouncementsItemModel;

  factory LocalAnnouncementsItemModel.fromJson(Map<String, dynamic> json) =>
      _$LocalAnnouncementsItemModelFromJson(json);
}
