import 'package:json_annotation/json_annotation.dart';

part 'air_quality_charts_item_model.g.dart';

@JsonSerializable()
class AirQualityChartsItemModel {
  @JsonKey(name: 'center_co')
  final num centerCo;
  @JsonKey(name: 'center_hm')
  final num centerHm;
  @JsonKey(name: 'center_pm')
  final num centerPm;
  @JsonKey(name: 'center_temp')
  final num centerTemp;
  @JsonKey(name: 'dornesti_hm')
  final num dornestiHm;
  @JsonKey(name: 'dornesti_pm')
  final num dornestiPm;
  @JsonKey(name: 'dornesti_pression')
  final num dornestiPression;
  @JsonKey(name: 'dornesti_temp')
  final num dornestiTemp;
  @JsonKey(name: 'dornesti_wind_direction')
  final num dornestiWindDirection;
  @JsonKey(name: 'dornesti_wind_speed')
  final num dornestiWindSpeed;
  @JsonKey(name: 'ro_meteo_hm')
  final num roMeteoHm;
  @JsonKey(name: 'ro_meteo_pression')
  final num roMeteoPression;
  @JsonKey(name: 'ro_meteo_snow')
  final String roMeteoSnow;
  @JsonKey(name: 'ro_meteo_temp')
  final num roMeteoTemp;
  @JsonKey(name: 'ro_meteo_wind_direction')
  final String roMeteoWindDirection;
  @JsonKey(name: 'ro_meteo_wind_speed')
  final num roMeteoWindSpeed;
  @JsonKey(name: 'timestamp')
  final String timestamp;

  const AirQualityChartsItemModel(
    this.centerCo,
    this.centerHm,
    this.centerPm,
    this.centerTemp,
    this.dornestiPm,
    this.dornestiHm,
    this.dornestiPression,
    this.dornestiTemp,
    this.dornestiWindDirection,
    this.dornestiWindSpeed,
    this.roMeteoHm,
    this.roMeteoPression,
    this.roMeteoSnow,
    this.roMeteoTemp,
    this.roMeteoWindDirection,
    this.roMeteoWindSpeed,
    this.timestamp,
  );

  factory AirQualityChartsItemModel.fromJson(Map<String, dynamic> json) =>
      _$AirQualityChartsItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$AirQualityChartsItemModelToJson(this);
}
