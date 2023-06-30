import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'report_problem_item_model.dart';

part 'report_problem_marker_model.g.dart';
part 'report_problem_marker_model.freezed.dart';

@freezed
class ReportProblemMarkerModel with _$ReportProblemMarkerModel {
  const factory ReportProblemMarkerModel(
          {@JsonKey(name: 'markers')
          required List<ReportProblemItemModel>? markers}) =
      _ReportProblemMarkerModel;

  factory ReportProblemMarkerModel.fromJson(Map<String, dynamic> json) =>
      _$ReportProblemMarkerModelFromJson(json);
}
