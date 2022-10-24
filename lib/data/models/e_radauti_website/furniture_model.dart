import 'package:flutterapperadauti/data/models/e_radauti_website/context_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'furniture_model.g.dart';

@JsonSerializable()
class FurnitureModel {
  @JsonKey(name: 'context')
  final List<ERContextModel> context;

  const FurnitureModel(this.context);

  factory FurnitureModel.fromJson(Map<String, dynamic> json) =>
      _$FurnitureModelFromJson(json);

  Map<String, dynamic> toJson() => _$FurnitureModelToJson(this);
}
