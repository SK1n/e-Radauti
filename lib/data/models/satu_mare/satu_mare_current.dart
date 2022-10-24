import 'package:flutterapperadauti/data/models/satu_mare/satu_mare_pm25.dart';
import 'package:flutterapperadauti/data/models/satu_mare/satu_mare_wind.dart';
import 'package:json_annotation/json_annotation.dart';

part 'satu_mare_current.g.dart';

@JsonSerializable()
class SatuMareCurrent {
  String? ts;
  int? aqius;
  int? aqicn;
  SatuMarePm25? pm25;
  String? mainus;
  String? maincn;
  String? condition;
  String? icon;
  int? humidity;
  int? pressure;
  int? temperature;
  SatuMareWind? wind;

  SatuMareCurrent(
      {this.ts,
      this.aqius,
      this.aqicn,
      this.pm25,
      this.mainus,
      this.maincn,
      this.condition,
      this.icon,
      this.humidity,
      this.pressure,
      this.temperature,
      this.wind});

  factory SatuMareCurrent.fromJson(Map<String, dynamic> json) =>
      _$SatuMareCurrentFromJson(json);

  Map<String, dynamic> toJson() => _$SatuMareCurrentToJson(this);
}
