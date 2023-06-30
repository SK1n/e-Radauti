// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_problem_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReportProblemModel _$$_ReportProblemModelFromJson(
        Map<String, dynamic> json) =>
    _$_ReportProblemModel(
      markers: (json['reports'] as List<dynamic>?)
          ?.map(
              (e) => ReportProblemItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ReportProblemModelToJson(
        _$_ReportProblemModel instance) =>
    <String, dynamic>{
      'reports': instance.markers,
    };
