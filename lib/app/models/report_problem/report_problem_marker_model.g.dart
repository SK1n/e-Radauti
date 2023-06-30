// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_problem_marker_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReportProblemMarkerModel _$$_ReportProblemMarkerModelFromJson(
        Map<String, dynamic> json) =>
    _$_ReportProblemMarkerModel(
      markers: (json['markers'] as List<dynamic>?)
          ?.map(
              (e) => ReportProblemItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ReportProblemMarkerModelToJson(
        _$_ReportProblemMarkerModel instance) =>
    <String, dynamic>{
      'markers': instance.markers,
    };
