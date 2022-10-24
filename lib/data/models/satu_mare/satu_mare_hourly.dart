import 'package:flutterapperadauti/data/models/satu_mare/satu_mare_pm25.dart';
import 'package:json_annotation/json_annotation.dart';

part 'satu_mare_hourly.g.dart';

@JsonSerializable()
class SatuMareHourly {
  String? ts;
  int? aqius;
  int? aqicn;
  SatuMarePm25? pm25;

  SatuMareHourly({this.ts, this.aqius, this.aqicn, this.pm25});

  factory SatuMareHourly.fromJson(Map<String, dynamic> json) =>
      _$SatuMareHourlyFromJson(json);

  Map<String, dynamic> toJson() => _$SatuMareHourlyToJson(this);
}
