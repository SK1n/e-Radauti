// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filters_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FiltersModel _$FiltersModelFromJson(Map<String, dynamic> json) => FiltersModel(
      json['pageNumber'] as num?,
      json['sort'] as String?,
      json['catID'] as String?,
      json['userID'] as String?,
      json['onlyDeleted'] as bool?,
      json['useCache'] as bool?,
      json['catSlug'] as String?,
      json['__routeName'] as String?,
    );

Map<String, dynamic> _$FiltersModelToJson(FiltersModel instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'sort': instance.sort,
      'catID': instance.catId,
      'userID': instance.userId,
      'onlyDeleted': instance.onlyDeleted,
      'useCache': instance.useCache,
      'catSlug': instance.catSlug,
      '__routeName': instance.routeName,
    };
