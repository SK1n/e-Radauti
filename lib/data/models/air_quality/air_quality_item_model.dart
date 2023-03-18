import 'package:flutterapperadauti/data/models/air_quality/air_quality_color_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'air_quality_item_model.g.dart';

@JsonSerializable()
class AirQualityItemModel {
  @JsonKey(name: 'center_co')
  final num centerCo;
  @JsonKey(name: 'center_hm')
  final num centerHm;
  @JsonKey(name: 'center_pm')
  final num centerPm;
  @JsonKey(name: 'center_pm_color')
  final AirQualityColorModel centerColor;
  @JsonKey(name: 'center_quality')
  final String centerQuality;
  @JsonKey(name: 'center_quality_image')
  final num centerImage;
  @JsonKey(name: 'center_temp')
  final num centerTemp;
  @JsonKey(name: 'date_time')
  final String dateTime;
  @JsonKey(name: 'dornesti_hm')
  final num dornestiHm;
  @JsonKey(name: 'dornesti_pm')
  final num dornestiPm;
  @JsonKey(name: 'dornesti_pm_color')
  final AirQualityColorModel dornestiColor;
  @JsonKey(name: 'dornesti_pression')
  final num dornestiPression;
  @JsonKey(name: 'dornesti_quality')
  final String dornestiQuality;
  @JsonKey(name: 'dornesti_quality_image')
  final num dornestiImage;
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
  const AirQualityItemModel(
    this.centerCo,
    this.centerHm,
    this.centerPm,
    this.centerColor,
    this.centerQuality,
    this.centerImage,
    this.centerTemp,
    this.dateTime,
    this.dornestiHm,
    this.dornestiPm,
    this.dornestiPression,
    this.dornestiQuality,
    this.dornestiImage,
    this.dornestiTemp,
    this.dornestiWindDirection,
    this.dornestiWindSpeed,
    this.roMeteoHm,
    this.roMeteoPression,
    this.roMeteoSnow,
    this.roMeteoTemp,
    this.roMeteoWindDirection,
    this.roMeteoWindSpeed,
    this.dornestiColor,
  );

  factory AirQualityItemModel.fromJson(Map<String, dynamic> json) =>
      _$AirQualityItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$AirQualityItemModelToJson(this);
}
