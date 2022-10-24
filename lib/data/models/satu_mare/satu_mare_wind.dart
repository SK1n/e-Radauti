import 'package:json_annotation/json_annotation.dart';

part 'satu_mare_wind.g.dart';

@JsonSerializable()
class SatuMareWind {
  double? speed;
  int? direction;

  SatuMareWind({this.speed, this.direction});

  factory SatuMareWind.fromJson(Map<String, dynamic> json) =>
      _$SatuMareWindFromJson(json);

  Map<String, dynamic> toJson() => _$SatuMareWindToJson(this);
}
