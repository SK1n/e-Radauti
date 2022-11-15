// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'train_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainModel _$TrainModelFromJson(Map<String, dynamic> json) => TrainModel(
      (json['train'] as List<dynamic>?)
          ?.map((e) => TrainItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TrainModelToJson(TrainModel instance) =>
    <String, dynamic>{
      'train': instance.items,
    };
