import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_problem_item_model.freezed.dart';
part 'report_problem_item_model.g.dart';

@freezed
class ReportProblemItemModel with _$ReportProblemItemModel {
  const factory ReportProblemItemModel({
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
  }) = _ReportProblemItemModel;

  factory ReportProblemItemModel.fromJson(Map<String, dynamic> json) =>
      _$ReportProblemItemModelFromJson(json);
}
