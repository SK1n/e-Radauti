import 'package:json_annotation/json_annotation.dart';

part 'public_institutions_item_model.g.dart';

@JsonSerializable()
class PublicInstitutionsItemModel {
  @JsonKey(name: 'email')
  final List<String>? emails;
  @JsonKey(name: 'phone')
  final List<String>? phoneNumbers;
  @JsonKey(name: 'title')
  final String? title;

  const PublicInstitutionsItemModel(this.emails, this.phoneNumbers, this.title);

  factory PublicInstitutionsItemModel.fromJson(Map<String, dynamic> json) =>
      _$PublicInstitutionsItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$PublicInstitutionsItemModelToJson(this);
}
