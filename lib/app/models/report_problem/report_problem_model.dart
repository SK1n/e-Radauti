import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_problem_model.freezed.dart';
part 'report_problem_model.g.dart';

@freezed
class ReportProblemModel with _$ReportProblemModel {
  const factory ReportProblemModel({
    @JsonKey(name: 'category', defaultValue: '') required String category,
    @JsonKey(name: 'description', defaultValue: '') required String description,
    @JsonKey(name: 'email', defaultValue: '') required String email,
    @JsonKey(name: 'index', defaultValue: 7) required int index,
    @JsonKey(name: 'institution', defaultValue: '') required String institution,
    @JsonKey(name: 'institution_email', defaultValue: '')
    required String institutionEmail,
    double? lat,
    double? long,
    @JsonKey(name: 'username', defaultValue: '') required String name,
    @JsonKey(name: 'phone', defaultValue: '') required String phone,
    @JsonKey(name: 'status', defaultValue: '') required String status,
    @JsonKey(name: 'subject', defaultValue: '') required String subject,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'images', defaultValue: []) required List<String> images,
    @JsonKey(name: 'email_sent', defaultValue: false) required bool emailSent,
    @JsonKey(name: 'shouldShowOnMap', defaultValue: false)
    required bool shouldShowOnMap,
    @JsonKey(name: 'userUID', defaultValue: '') required String userUid,
  }) = _ReportProblemModel;

  factory ReportProblemModel.fromJson(Map<String, dynamic> json) =>
      _$ReportProblemModelFromJson(json);
}
