// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taxi_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxiItemModel _$TaxiItemModelFromJson(Map<String, dynamic> json) =>
    TaxiItemModel(
      json['car_type'] as String,
      json['driver_name'] as String,
      json['image_url'] as String,
      json['phone_number'] as String,
      json['plate_number'] as String,
    );

Map<String, dynamic> _$TaxiItemModelToJson(TaxiItemModel instance) =>
    <String, dynamic>{
      'car_type': instance.carType,
      'driver_name': instance.driverName,
      'image_url': instance.image,
      'phone_number': instance.phoneNumber,
      'plate_number': instance.plateNumber,
    };
