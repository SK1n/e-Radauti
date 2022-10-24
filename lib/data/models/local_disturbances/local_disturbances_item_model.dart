import 'package:json_annotation/json_annotation.dart';

part 'local_disturbances_item_model.g.dart';

@JsonSerializable()
class LocalDisturbancesItemModel {
  @JsonKey(name: 'email')
  final List<String>? emails;
  @JsonKey(name: 'phone')
  final List<String>? phoneNumbers;
  @JsonKey(name: 'title')
  final String? title;

  const LocalDisturbancesItemModel(this.emails, this.phoneNumbers, this.title);

  factory LocalDisturbancesItemModel.fromJson(Map<String, dynamic> json) =>
      _$LocalDisturbancesItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocalDisturbancesItemModelToJson(this);
}
