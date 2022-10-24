import 'package:json_annotation/json_annotation.dart';

part 'satu_mare_coordinates.g.dart';

@JsonSerializable()
class SatuMareCoordinates {
  double? latitude;
  double? longitude;

  SatuMareCoordinates({this.latitude, this.longitude});
  factory SatuMareCoordinates.fromJson(Map<String, dynamic> json) =>
      _$SatuMareCoordinatesFromJson(json);

  Map<String, dynamic> toJson() => _$SatuMareCoordinatesToJson(this);
}
