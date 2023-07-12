// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'taxi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaxiModel _$$_TaxiModelFromJson(Map<String, dynamic> json) => _$_TaxiModel(
      items: (json['taxi'] as List<dynamic>?)
              ?.map((e) => TaxiItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_TaxiModelToJson(_$_TaxiModel instance) =>
    <String, dynamic>{
      'taxi': instance.items,
    };

_$_TaxiItemModel _$$_TaxiItemModelFromJson(Map<String, dynamic> json) =>
    _$_TaxiItemModel(
      model: json['car_type'] as String? ?? '',
      name: json['driver_name'] as String? ?? '',
      url: json['image_url'] as String? ?? '',
      tel: json['phone_number'] as String? ?? '',
      plate: json['plate_number'] as String? ?? '',
    );

Map<String, dynamic> _$$_TaxiItemModelToJson(_$_TaxiItemModel instance) =>
    <String, dynamic>{
      'car_type': instance.model,
      'driver_name': instance.name,
      'image_url': instance.url,
      'phone_number': instance.tel,
      'plate_number': instance.plate,
    };
