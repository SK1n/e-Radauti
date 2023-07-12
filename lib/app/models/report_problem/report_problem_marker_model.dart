import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_problem_marker_model.freezed.dart';
part 'report_problem_marker_model.g.dart';

@freezed
class ReportProblemMarkerModel with _$ReportProblemMarkerModel {
  const factory ReportProblemMarkerModel(
          {@JsonKey(name: 'markers')
          required List<ReportProblemMarkerItemModel>? markers}) =
      _ReportProblemMarkerModel;

  factory ReportProblemMarkerModel.fromJson(Map<String, dynamic> json) =>
      _$ReportProblemMarkerModelFromJson(json);
}

@freezed
class ReportProblemMarkerItemModel with _$ReportProblemMarkerItemModel {
  const factory ReportProblemMarkerItemModel({
    required String category,
    required String description,
    required String email,
    required int index,
    required String institution,
    @JsonKey(name: 'institution_email') required String institutionEmail,
    double? lat,
    double? long,
    required String name,
    required String phone,
    required String status,
    required String subject,
    @JsonKey(name: 'created_at') String? createdAt,
    required List<String> url,
  }) = _ReportProblemMarkerItemModel;

  factory ReportProblemMarkerItemModel.fromJson(Map<String, dynamic> json) =>
      _$ReportProblemMarkerItemModelFromJson(json);
}
