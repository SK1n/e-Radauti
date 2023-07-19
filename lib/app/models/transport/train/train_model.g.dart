// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'train_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TrainModel _$$_TrainModelFromJson(Map<String, dynamic> json) =>
    _$_TrainModel(
      items: (json['trains'] as List<dynamic>?)
              ?.map((e) => TrainItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_TrainModelToJson(_$_TrainModel instance) =>
    <String, dynamic>{
      'trains': instance.items,
    };

_$_TrainItemModel _$$_TrainItemModelFromJson(Map<String, dynamic> json) =>
    _$_TrainItemModel(
      trainNr: json['train_nr'] as String? ?? '',
      trainCategory: json['train_category'] as String? ?? '',
      stations: (json['stations'] as List<dynamic>?)
              ?.map(
                  (e) => StationsItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_TrainItemModelToJson(_$_TrainItemModel instance) =>
    <String, dynamic>{
      'train_nr': instance.trainNr,
      'train_category': instance.trainCategory,
      'stations': instance.stations,
    };

_$_StationsItemModel _$$_StationsItemModelFromJson(Map<String, dynamic> json) =>
    _$_StationsItemModel(
      aStation: json['arrival_station'] as String? ?? '',
      aTime: json['arrival_time'] as String? ?? '',
      dStation: json['departure_station'] as String? ?? '',
      dTime: json['departure_time'] as String? ?? '',
    );

Map<String, dynamic> _$$_StationsItemModelToJson(
        _$_StationsItemModel instance) =>
    <String, dynamic>{
      'arrival_station': instance.aStation,
      'arrival_time': instance.aTime,
      'departure_station': instance.dStation,
      'departure_time': instance.dTime,
    };
