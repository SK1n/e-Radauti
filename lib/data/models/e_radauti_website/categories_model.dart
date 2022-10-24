import 'package:flutterapperadauti/data/models/e_radauti_website/related_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categories_model.g.dart';

@JsonSerializable()
class CategoriesModel {
  @JsonKey(name: 'id')
  final num? id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'slug')
  final String? slug;
  @JsonKey(name: 'content')
  final String? content;
  @JsonKey(name: 'related')
  final RelatedModel related;
  const CategoriesModel(
      this.id, this.title, this.slug, this.content, this.related);

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesModelToJson(this);
}
