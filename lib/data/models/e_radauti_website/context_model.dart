import 'package:flutterapperadauti/data/models/e_radauti_website/categories_model.dart';
import 'package:flutterapperadauti/data/models/e_radauti_website/match_model.dart';
import 'package:flutterapperadauti/data/models/e_radauti_website/matched_categories_model.dart';
import 'package:flutterapperadauti/data/models/e_radauti_website/posts_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'context_model.g.dart';

@JsonSerializable()
class ERContextModel {
  @JsonKey(name: 'matchedCategories')
  final MatchedCategoriesModel? matchedCategories;
  @JsonKey(name: 'categories')
  final List<CategoriesModel>? categories;
  @JsonKey(name: 'posts')
  final PostsModel? posts;
  @JsonKey(name: 'currentRouteIndex')
  final num? currentRouteIndex;
  @JsonKey(name: 'match')
  final MatchModel match;

  const ERContextModel(this.matchedCategories, this.categories, this.posts,
      this.currentRouteIndex, this.match);

  factory ERContextModel.fromJson(Map<String, dynamic> json) =>
      _$ERContextModelFromJson(json);

  Map<String, dynamic> toJson() => _$ERContextModelToJson(this);
}
