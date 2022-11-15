// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'context_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ERContextModel _$ERContextModelFromJson(Map<String, dynamic> json) =>
    ERContextModel(
      json['matchedCategories'] == null
          ? null
          : MatchedCategoriesModel.fromJson(
              json['matchedCategories'] as Map<String, dynamic>),
      (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoriesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['posts'] == null
          ? null
          : PostsModel.fromJson(json['posts'] as Map<String, dynamic>),
      json['currentRouteIndex'] as num?,
      MatchModel.fromJson(json['match'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ERContextModelToJson(ERContextModel instance) =>
    <String, dynamic>{
      'matchedCategories': instance.matchedCategories,
      'categories': instance.categories,
      'posts': instance.posts,
      'currentRouteIndex': instance.currentRouteIndex,
      'match': instance.match,
    };
