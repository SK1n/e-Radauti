// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'records_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordsModel _$RecordsModelFromJson(Map<String, dynamic> json) => RecordsModel(
      json['id'] as num?,
      json['cat_id'] as num?,
      json['user_id'] as num?,
      json['status'] as num?,
      json['price'] as num?,
      json['featured'] as num?,
      json['title'] as String?,
      json['slug'] as String?,
      json['raw_content'] as String?,
      json['currency'] as String?,
      json['date_created'] as String?,
      json['date_expires'] as String?,
      json['date_modified'] as String?,
    );

Map<String, dynamic> _$RecordsModelToJson(RecordsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cat_id': instance.catId,
      'user_id': instance.userId,
      'status': instance.status,
      'price': instance.price,
      'featured': instance.featured,
      'title': instance.title,
      'slug': instance.slug,
      'raw_content': instance.rawContent,
      'currency': instance.currency,
      'date_created': instance.dateCreated,
      'date_expires': instance.dateExpires,
      'date_modified': instance.dateModified,
    };
