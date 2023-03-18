import 'package:flutterapperadauti/data/models/air_quality/air_quality_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'air_quality_model.g.dart';

@JsonSerializable()
class AirQualityModel {
  @JsonKey(name: 'air')
  final List<AirQualityItemModel> items;

  const AirQualityModel(this.items);

  factory AirQualityModel.fromJson(Map<String, dynamic> json) =>
      _$AirQualityModelFromJson(json);
  Map<String, dynamic> toJson() => _$AirQualityModelToJson(this);
}
