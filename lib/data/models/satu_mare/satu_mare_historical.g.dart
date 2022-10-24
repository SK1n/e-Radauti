// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'satu_mare_historical.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SatuMareHistorical _$SatuMareHistoricalFromJson(Map<String, dynamic> json) =>
    SatuMareHistorical(
      hourly: (json['hourly'] as List<dynamic>?)
          ?.map((e) => SatuMareHourly.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SatuMareHistoricalToJson(SatuMareHistorical instance) =>
    <String, dynamic>{
      'hourly': instance.hourly,
    };
