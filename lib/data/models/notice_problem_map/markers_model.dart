import 'package:json_annotation/json_annotation.dart';

part 'markers_model.g.dart';

@JsonSerializable()
class MarkersModel {
  final String category;
  final String description;
  final String email;
  final int index;
  final String institution;
  @JsonKey(name: 'institution_email')
  final String institutionEmail;
  final double? lat;
  final double? long;
  final String name;
  final String phone;
  final String status;
  final String subject;
  final List<String> url;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  const MarkersModel({
    required this.category,
    required this.description,
    required this.email,
    required this.index,
    required this.institution,
    required this.institutionEmail,
    this.lat,
    this.long,
    required this.name,
    required this.phone,
    required this.status,
    required this.subject,
    this.createdAt,
    required this.url,
  });

  factory MarkersModel.fromJson(Map<String, dynamic> json) =>
      _$MarkersModelFromJson(json);
  Map<String, dynamic> toJson() => _$MarkersModelToJson(this);
}
