import 'package:json_annotation/json_annotation.dart';

part 'satu_mare_pm25.g.dart';

@JsonSerializable()
class SatuMarePm25 {
  int? aqius;
  int? aqicn;
  int? concentration;

  SatuMarePm25({this.aqius, this.aqicn, this.concentration});

  factory SatuMarePm25.fromJson(Map<String, dynamic> json) =>
      _$SatuMarePm25FromJson(json);

  Map<String, dynamic> toJson() => _$SatuMarePm25ToJson(this);
}
