import 'package:flutterapperadauti/data/models/satu_mare/satu_mare_hourly.dart';
import 'package:json_annotation/json_annotation.dart';

part 'satu_mare_historical.g.dart';

@JsonSerializable()
class SatuMareHistorical {
  List<SatuMareHourly>? hourly;

  SatuMareHistorical({this.hourly});

  factory SatuMareHistorical.fromJson(Map<String, dynamic> json) =>
      _$SatuMareHistoricalFromJson(json);

  Map<String, dynamic> toJson() => _$SatuMareHistoricalToJson(this);
}
