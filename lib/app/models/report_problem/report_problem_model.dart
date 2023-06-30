import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'report_problem_item_model.dart';

part 'report_problem_model.g.dart';
part 'report_problem_model.freezed.dart';

@freezed
class ReportProblemModel with _$ReportProblemModel {
  const factory ReportProblemModel(
      {@JsonKey(name: 'reports')
      required List<ReportProblemItemModel>? markers}) = _ReportProblemModel;

  factory ReportProblemModel.fromJson(Map<String, dynamic> json) =>
      _$ReportProblemModelFromJson(json);
}
