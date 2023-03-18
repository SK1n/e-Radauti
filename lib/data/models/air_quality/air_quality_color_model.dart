import 'package:json_annotation/json_annotation.dart';

part 'air_quality_color_model.g.dart';

@JsonSerializable()
class AirQualityColorModel {
  @JsonKey(name: 'R')
  final int r;
  @JsonKey(name: 'G')
  final int g;
  @JsonKey(name: 'B')
  final int b;
  const AirQualityColorModel(
    this.r,
    this.g,
    this.b,
  );

  factory AirQualityColorModel.fromJson(Map<String, dynamic> json) =>
      _$AirQualityColorModelFromJson(json);
  Map<String, dynamic> toJson() => _$AirQualityColorModelToJson(this);
}
