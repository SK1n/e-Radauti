import 'package:json_annotation/json_annotation.dart';

part 'air_quality_charts_item_model.g.dart';

@JsonSerializable()
class AirQualityChartsItemModel {
  @JsonKey(name: 'date')
  final String? date;
  @JsonKey(name: 'direction')
  final String? direction;
  @JsonKey(name: 'formated_date', defaultValue: '24/10/2022 2:32')
  final String? formatedDate;
  @JsonKey(name: 'co2')
  final num? co;
  @JsonKey(name: 'humidity')
  final num? humidity;
  @JsonKey(name: 'humidity_center')
  final num? humidityC;
  @JsonKey(name: 'pm25')
  final num? pm;
  @JsonKey(name: 'pression')
  final num? pression;
  @JsonKey(name: 'temp_center')
  final num? tempC;
  @JsonKey(name: 'temp_meteo')
  final num? tempM;
  @JsonKey(name: 'wind')
  final num? wind;

  const AirQualityChartsItemModel(
      this.date,
      this.direction,
      this.formatedDate,
      this.co,
      this.humidity,
      this.humidityC,
      this.pm,
      this.pression,
      this.tempC,
      this.tempM,
      this.wind);

  factory AirQualityChartsItemModel.fromJson(Map<String, dynamic> json) =>
      _$AirQualityChartsItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$AirQualityChartsItemModelToJson(this);
}
