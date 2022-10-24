import 'package:flutterapperadauti/data/models/e_radauti_website/related_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'matched_categories_model.g.dart';

@JsonSerializable()
class MatchedCategoriesModel {
  @JsonKey(name: 'id')
  final num? id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'slug')
  final String? slug;
  @JsonKey(name: 'content')
  final String? content;
  @JsonKey(name: 'related')
  final List<RelatedModel>? related;

  const MatchedCategoriesModel(
      this.id, this.title, this.slug, this.content, this.related);

  factory MatchedCategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$MatchedCategoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$MatchedCategoriesModelToJson(this);
}
