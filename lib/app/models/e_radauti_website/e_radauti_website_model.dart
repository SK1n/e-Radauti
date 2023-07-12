import 'package:freezed_annotation/freezed_annotation.dart';

part 'e_radauti_website_model.g.dart';
part 'e_radauti_website_model.freezed.dart';

@freezed
class ERadautiWebsiteModel with _$ERadautiWebsiteModel {
  const factory ERadautiWebsiteModel({
    @JsonKey(name: 'context') required ERadautiWebsiteContextModel context,
  }) = _ERadautiWebsiteModel;

  factory ERadautiWebsiteModel.fromJson(Map<String, dynamic> json) =>
      _$ERadautiWebsiteModelFromJson(json);
}

@freezed
class ERadautiWebsiteContextModel with _$ERadautiWebsiteContextModel {
  const factory ERadautiWebsiteContextModel({
    @JsonKey(name: 'posts') required ERadautiWebsitePostsModel posts,
  }) = _ERadautiWebsiteContextModel;

  factory ERadautiWebsiteContextModel.fromJson(Map<String, dynamic> json) =>
      _$ERadautiWebsiteContextModelFromJson(json);
}

@freezed
class ERadautiWebsitePostsModel with _$ERadautiWebsitePostsModel {
  const factory ERadautiWebsitePostsModel({
    @JsonKey(name: 'records')
    required List<ERadautiWebsiteRecordsModel> records,
  }) = _ERadautiWebsitePostsModel;

  factory ERadautiWebsitePostsModel.fromJson(Map<String, dynamic> json) =>
      _$ERadautiWebsitePostsModelFromJson(json);
}

@freezed
class ERadautiWebsiteRecordsModel with _$ERadautiWebsiteRecordsModel {
  const factory ERadautiWebsiteRecordsModel({
    @JsonKey(name: 'id', defaultValue: 0) required num id,
    @JsonKey(name: 'cat_id', defaultValue: 0) required num catId,
    @JsonKey(name: 'user_id', defaultValue: 0) required num userId,
    @JsonKey(name: 'status', defaultValue: 0) required num status,
    @JsonKey(name: 'price', defaultValue: 0) required num price,
    @JsonKey(name: 'featured', defaultValue: 0) required num featured,
    @JsonKey(name: 'title', defaultValue: '') required String title,
    @JsonKey(name: 'slug', defaultValue: '') required String slug,
    @JsonKey(name: 'raw_content', defaultValue: '') required String rawContent,
    @JsonKey(name: 'currency', defaultValue: '') required String currency,
    @JsonKey(name: 'date_created', defaultValue: '')
    required String dateCreated,
    @JsonKey(name: 'date_expires', defaultValue: '')
    required String dateExpires,
    @JsonKey(name: 'date_modified', defaultValue: '')
    required String dateModified,
  }) = _ERadautiWebsiteRecordsModel;

  factory ERadautiWebsiteRecordsModel.fromJson(Map<String, dynamic> json) =>
      _$ERadautiWebsiteRecordsModelFromJson(json);
}
