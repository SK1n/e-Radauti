// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'e_radauti_website_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ERadautiWebsiteModel _$$_ERadautiWebsiteModelFromJson(
        Map<String, dynamic> json) =>
    _$_ERadautiWebsiteModel(
      context: ERadautiWebsiteContextModel.fromJson(
          json['context'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ERadautiWebsiteModelToJson(
        _$_ERadautiWebsiteModel instance) =>
    <String, dynamic>{
      'context': instance.context,
    };

_$_ERadautiWebsiteContextModel _$$_ERadautiWebsiteContextModelFromJson(
        Map<String, dynamic> json) =>
    _$_ERadautiWebsiteContextModel(
      posts: ERadautiWebsitePostsModel.fromJson(
          json['posts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ERadautiWebsiteContextModelToJson(
        _$_ERadautiWebsiteContextModel instance) =>
    <String, dynamic>{
      'posts': instance.posts,
    };

_$_ERadautiWebsitePostsModel _$$_ERadautiWebsitePostsModelFromJson(
        Map<String, dynamic> json) =>
    _$_ERadautiWebsitePostsModel(
      records: (json['records'] as List<dynamic>)
          .map((e) =>
              ERadautiWebsiteRecordsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ERadautiWebsitePostsModelToJson(
        _$_ERadautiWebsitePostsModel instance) =>
    <String, dynamic>{
      'records': instance.records,
    };

_$_ERadautiWebsiteRecordsModel _$$_ERadautiWebsiteRecordsModelFromJson(
        Map<String, dynamic> json) =>
    _$_ERadautiWebsiteRecordsModel(
      id: json['id'] as num? ?? 0,
      catId: json['cat_id'] as num? ?? 0,
      userId: json['user_id'] as num? ?? 0,
      status: json['status'] as num? ?? 0,
      price: json['price'] as num? ?? 0,
      featured: json['featured'] as num? ?? 0,
      title: json['title'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      rawContent: json['raw_content'] as String? ?? '',
      currency: json['currency'] as String? ?? '',
      dateCreated: json['date_created'] as String? ?? '',
      dateExpires: json['date_expires'] as String? ?? '',
      dateModified: json['date_modified'] as String? ?? '',
    );

Map<String, dynamic> _$$_ERadautiWebsiteRecordsModelToJson(
        _$_ERadautiWebsiteRecordsModel instance) =>
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
