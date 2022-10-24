import 'package:flutterapperadauti/data/models/satu_mare/satu_mare_coordinates.dart';
import 'package:flutterapperadauti/data/models/satu_mare/satu_mare_current.dart';
import 'package:flutterapperadauti/data/models/satu_mare/satu_mare_historical.dart';
import 'package:json_annotation/json_annotation.dart';

part 'satu_mare_air_quality.g.dart';

@JsonSerializable()
class SatuMareAirQuality {
  SatuMareCurrent? current;
  SatuMareHistorical? historical;
  SatuMareCoordinates? coordinates;
  String? name;
  String? city;

  SatuMareAirQuality(
      {this.current, this.historical, this.coordinates, this.name, this.city});

  factory SatuMareAirQuality.fromJson(Map<String, dynamic> json) =>
      _$SatuMareAirQualityFromJson(json);

  Map<String, dynamic> toJson() => _$SatuMareAirQualityToJson(this);
}
