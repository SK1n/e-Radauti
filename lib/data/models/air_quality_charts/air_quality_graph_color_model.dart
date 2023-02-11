import 'package:json_annotation/json_annotation.dart';

part 'air_quality_graph_color_model.g.dart';

@JsonSerializable()
class AirQualityGraphColorModel {
  @JsonKey(name: 'R')
  final num r;
  @JsonKey(name: 'G')
  final num g;
  @JsonKey(name: 'B')
  final num b;
  const AirQualityGraphColorModel(this.r, this.g, this.b);

  factory AirQualityGraphColorModel.fromJson(Map<String, dynamic> json) =>
      _$AirQualityGraphColorModelFromJson(json);
  Map<String, dynamic> toJson() => _$AirQualityGraphColorModelToJson(this);
}
