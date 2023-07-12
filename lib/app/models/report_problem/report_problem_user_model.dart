import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_problem_user_model.freezed.dart';
part 'report_problem_user_model.g.dart';

@freezed
class ReportProblemUserModel with _$ReportProblemUserModel {
  const factory ReportProblemUserModel(
          {@JsonKey(name: 'reports', defaultValue: [])
          required List<ReportProblemUserItemModel> markers}) =
      _ReportProblemUserModel;

  factory ReportProblemUserModel.fromJson(Map<String, dynamic> json) =>
      _$ReportProblemUserModelFromJson(json);
}

@freezed
class ReportProblemUserItemModel with _$ReportProblemUserItemModel {
  const factory ReportProblemUserItemModel({
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
  }) = _ReportProblemUserItemModel;

  factory ReportProblemUserItemModel.fromJson(Map<String, dynamic> json) =>
      _$ReportProblemUserItemModelFromJson(json);
}
