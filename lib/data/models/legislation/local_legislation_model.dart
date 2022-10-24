import 'package:flutterapperadauti/data/models/legislation/local_legislation_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'local_legislation_model.g.dart';

@JsonSerializable()
class LocalLegislationModel {
  @JsonKey(name: '2020')
  final List<LocalLegislationItemModel>? items;

  const LocalLegislationModel({this.items});

  factory LocalLegislationModel.fromJson(Map<String, dynamic> json) =>
      _$LocalLegislationModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocalLegislationModelToJson(this);
}
