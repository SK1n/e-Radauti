import 'package:flutterapperadauti/data/models/local_disturbances/local_disturbances_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'local_disturbances_model.g.dart';

@JsonSerializable()
class LocalDisturbancesModel {
  @JsonKey(name: 'upsets')
  final List<LocalDisturbancesItemModel>? items;

  const LocalDisturbancesModel(this.items);

  factory LocalDisturbancesModel.fromJson(Map<String, dynamic> json) =>
      _$LocalDisturbancesModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocalDisturbancesModelToJson(this);
}
