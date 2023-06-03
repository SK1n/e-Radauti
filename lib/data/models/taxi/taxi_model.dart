import 'package:flutterapperadauti/data/models/taxi/taxi_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'taxi_model.g.dart';

@JsonSerializable()
class TaxiModel {
  @JsonKey(name: 'taxi')
  final List<TaxiItemModel> taxis;

  const TaxiModel(this.taxis);

  factory TaxiModel.fromJson(Map<String, dynamic> json) =>
      _$TaxiModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaxiModelToJson(this);
}
