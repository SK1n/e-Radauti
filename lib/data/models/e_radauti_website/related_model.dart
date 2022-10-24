import 'package:json_annotation/json_annotation.dart';

part 'related_model.g.dart';

@JsonSerializable()
class RelatedModel {
  @JsonKey(name: 'link')
  final String? link;
  @JsonKey(name: 'archiveLink')
  final String? archiveLink;
  @JsonKey(name: 'deletedPostCount')
  final num? deletedPostCount;
  @JsonKey(name: 'postCount')
  final num? postCount;

  const RelatedModel(
      this.link, this.archiveLink, this.deletedPostCount, this.postCount);

  factory RelatedModel.fromJson(Map<String, dynamic> json) =>
      _$RelatedModelFromJson(json);

  Map<String, dynamic> toJson() => _$RelatedModelToJson(this);
}
