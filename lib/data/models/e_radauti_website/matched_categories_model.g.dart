// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matched_categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchedCategoriesModel _$MatchedCategoriesModelFromJson(
        Map<String, dynamic> json) =>
    MatchedCategoriesModel(
      json['id'] as num?,
      json['title'] as String?,
      json['slug'] as String?,
      json['content'] as String?,
      (json['related'] as List<dynamic>?)
          ?.map((e) => RelatedModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MatchedCategoriesModelToJson(
        MatchedCategoriesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'content': instance.content,
      'related': instance.related,
    };
