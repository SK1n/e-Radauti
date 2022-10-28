import 'package:flutterapperadauti/data/models/satu_mare/satu_mare_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'satu_mare_model.g.dart';

@JsonSerializable()
class SatuMareModel {
  @JsonKey(name: 'air')
  final List<SatuMareItemModel>? item;

  const SatuMareModel(this.item);

  factory SatuMareModel.fromJson(Map<String, dynamic> json) =>
      _$SatuMareModelFromJson(json);
  Map<String, dynamic> toJson() => _$SatuMareModelToJson(this);
}
