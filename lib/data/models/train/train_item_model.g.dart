// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'train_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainItemModel _$TrainItemModelFromJson(Map<String, dynamic> json) =>
    TrainItemModel(
      (json['stations'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['time_table'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['title'] as String?,
      json['train'] as String?,
    );

Map<String, dynamic> _$TrainItemModelToJson(TrainItemModel instance) =>
    <String, dynamic>{
      'stations': instance.stations,
      'time_table': instance.timeTable,
      'title': instance.route,
      'train': instance.train,
    };
