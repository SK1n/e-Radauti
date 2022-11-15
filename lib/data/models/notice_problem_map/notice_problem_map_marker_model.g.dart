// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_problem_map_marker_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoticeProblemMapMarkerModel _$NoticeProblemMapMarkerModelFromJson(
        Map<String, dynamic> json) =>
    NoticeProblemMapMarkerModel(
      markers: (json['markers'] as List<dynamic>?)
          ?.map((e) => MarkersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NoticeProblemMapMarkerModelToJson(
        NoticeProblemMapMarkerModel instance) =>
    <String, dynamic>{
      'markers': instance.markers,
    };
