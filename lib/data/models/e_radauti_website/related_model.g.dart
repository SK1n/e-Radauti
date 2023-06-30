// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'related_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelatedModel _$RelatedModelFromJson(Map<String, dynamic> json) => RelatedModel(
      json['link'] as String?,
      json['archiveLink'] as String?,
      json['deletedPostCount'] as num?,
      json['postCount'] as num?,
    );

Map<String, dynamic> _$RelatedModelToJson(RelatedModel instance) =>
    <String, dynamic>{
      'link': instance.link,
      'archiveLink': instance.archiveLink,
      'deletedPostCount': instance.deletedPostCount,
      'postCount': instance.postCount,
    };
