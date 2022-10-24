// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'satu_mare_coordinates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SatuMareCoordinates _$SatuMareCoordinatesFromJson(Map<String, dynamic> json) =>
    SatuMareCoordinates(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SatuMareCoordinatesToJson(
        SatuMareCoordinates instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
