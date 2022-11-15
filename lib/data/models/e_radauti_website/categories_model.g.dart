// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesModel _$CategoriesModelFromJson(Map<String, dynamic> json) =>
    CategoriesModel(
      json['id'] as num?,
      json['title'] as String?,
      json['slug'] as String?,
      json['content'] as String?,
      RelatedModel.fromJson(json['related'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoriesModelToJson(CategoriesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'content': instance.content,
      'related': instance.related,
    };
