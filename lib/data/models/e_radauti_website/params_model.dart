import 'package:json_annotation/json_annotation.dart';

part 'params_model.g.dart';

@JsonSerializable()
class ParamsModel {
  @JsonKey(name: 'catSlug')
  final String? catSlug;
  @JsonKey(name: 'catID')
  final String? catId;

  const ParamsModel(this.catId, this.catSlug);

  factory ParamsModel.fromJson(Map<String, dynamic> json) =>
      _$ParamsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ParamsModelToJson(this);
}
