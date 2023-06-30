// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostsModel _$PostsModelFromJson(Map<String, dynamic> json) => PostsModel(
      json['prevPageUrl'] as String?,
      json['nextPageUrl'] as String?,
      json['totalCount'] as num?,
      json['pageCount'] as num?,
      json['filters'] == null
          ? null
          : FiltersModel.fromJson(json['filters'] as Map<String, dynamic>),
      (json['records'] as List<dynamic>?)
          ?.map((e) => RecordsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostsModelToJson(PostsModel instance) =>
    <String, dynamic>{
      'prevPageUrl': instance.prev,
      'nextPageUrl': instance.next,
      'totalCount': instance.totalCount,
      'pageCount': instance.pageCount,
      'filters': instance.filters,
      'records': instance.records,
    };
