import 'package:json_annotation/json_annotation.dart';

part 'wind_model.g.dart';

@JsonSerializable()
class WindModel {
  @JsonKey(name: 'vant')
  final String wind;
  @JsonKey(name: 'presiunetext')
  final String pression;

  WindModel(this.wind, this.pression);

  factory WindModel.fromJson(Map<String, dynamic> json) =>
      _$WindModelFromJson(json);

  Map<String, dynamic> toJson() => _$WindModelToJson(this);
}
