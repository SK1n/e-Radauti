import 'package:json_annotation/json_annotation.dart';

part 'air_quality_item_model.g.dart';

@JsonSerializable()
class AirQualityItemModel {
  @JsonKey(name: 'R')
  final int? r;
  @JsonKey(name: 'G')
  final int? g;
  @JsonKey(name: 'B')
  final int? b;
  @JsonKey(name: 'A')
  final int? a;
  @JsonKey(name: 'co2')
  final num? co;
  @JsonKey(name: 'pm25')
  final num? pm;
  @JsonKey(name: 'tp')
  final num? tp;
  @JsonKey(name: 'wind')
  final String? wind;
  @JsonKey(name: 'pression')
  final String? pression;
  @JsonKey(name: 'airTS')
  final String? airTs;
  @JsonKey(name: 'windMs')
  final String? windMs;
  @JsonKey(name: 'direction')
  final String? direction;
  @JsonKey(name: 'formatedPression')
  final String? fPression;
  @JsonKey(name: 'formatedDate')
  final String? fDate;
  @JsonKey(name: 'quality')
  final String? quality;
  @JsonKey(name: 'hm')
  final num? hm;

  const AirQualityItemModel(
      this.r,
      this.g,
      this.b,
      this.a,
      this.co,
      this.pm,
      this.tp,
      this.wind,
      this.pression,
      this.airTs,
      this.windMs,
      this.direction,
      this.fPression,
      this.fDate,
      this.quality,
      this.hm);

  factory AirQualityItemModel.fromJson(Map<String, dynamic> json) =>
      _$AirQualityItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$AirQualityItemModelToJson(this);
}
