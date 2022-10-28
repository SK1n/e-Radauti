import 'package:json_annotation/json_annotation.dart';

part 'satu_mare_item_model.g.dart';

@JsonSerializable()
class SatuMareItemModel {
  @JsonKey(name: 'R')
  final int? r;
  @JsonKey(name: 'G')
  final int? g;
  @JsonKey(name: 'B')
  final int? b;
  @JsonKey(name: 'A')
  final int? a;
  @JsonKey(name: 'direction')
  final String? direction;
  @JsonKey(name: 'formatedDate')
  final String? fDate;
  @JsonKey(name: 'quality')
  final String? quality;
  @JsonKey(name: 'ts')
  final String? ts;
  @JsonKey(name: 'directionDegrees')
  final num? directionDegrees;
  @JsonKey(name: 'hm')
  final num? hm;
  @JsonKey(name: 'pm25')
  final num? pm;
  @JsonKey(name: 'pression')
  final num? pression;
  @JsonKey(name: 'temp')
  final num? temp;
  @JsonKey(name: 'wind')
  final num? wind;

  const SatuMareItemModel(
      this.r,
      this.g,
      this.b,
      this.a,
      this.direction,
      this.fDate,
      this.quality,
      this.ts,
      this.directionDegrees,
      this.hm,
      this.pm,
      this.pression,
      this.temp,
      this.wind);

  factory SatuMareItemModel.fromJson(Map<String, dynamic> json) =>
      _$SatuMareItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$SatuMareItemModelToJson(this);
}
