import 'package:flutterapperadauti/data/models/air_quality_charts/air_quality_charts_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'air_quality_charts_model.g.dart';

@JsonSerializable()
class AirQualityChartsModel {
  @JsonKey(name: 'air')
  final List<AirQualityChartsItemModel>? items;

  const AirQualityChartsModel(this.items);

  factory AirQualityChartsModel.fromJson(Map<String, dynamic> json) =>
      _$AirQualityChartsModelFromJson(json);
  Map<String, dynamic> toJson() => _$AirQualityChartsModelToJson(this);
}
