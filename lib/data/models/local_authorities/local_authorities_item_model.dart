import 'package:json_annotation/json_annotation.dart';

part 'local_authorities_item_model.g.dart';

@JsonSerializable()
class LocalAuthoritiesItemModel {
  @JsonKey(name: 'email')
  final List<String>? emails;
  @JsonKey(name: 'phone')
  final List<String>? phoneNumbers;
  @JsonKey(name: 'title')
  final String? title;

  const LocalAuthoritiesItemModel(this.emails, this.phoneNumbers, this.title);

  factory LocalAuthoritiesItemModel.fromJson(Map<String, dynamic> json) =>
      _$LocalAuthoritiesItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocalAuthoritiesItemModelToJson(this);
}
