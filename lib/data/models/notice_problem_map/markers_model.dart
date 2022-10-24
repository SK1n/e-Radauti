import 'package:json_annotation/json_annotation.dart';

part 'markers_model.g.dart';

@JsonSerializable()
class MarkersModel {
  String? category;
  String? description;
  String? email;
  num? index;
  String? institution;
  String? institutionEmail;
  num? lat;
  num? long;
  String? name;
  String? phone;
  String? status;
  String? subject;
  List<String>? url;

  MarkersModel({
    this.category,
    this.description,
    this.email,
    this.index,
    this.institution,
    this.institutionEmail,
    this.lat,
    this.long,
    this.name,
    this.phone,
    this.status,
    this.subject,
  });

  factory MarkersModel.fromJson(Map<String, dynamic> json) =>
      _$MarkersModelFromJson(json);
  Map<String, dynamic> toJson() => _$MarkersModelToJson(this);
}
