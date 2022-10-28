import 'package:json_annotation/json_annotation.dart';

import 'local_legislation_item_model.dart';

part 'local_legislation_model.g.dart';

@JsonSerializable()
class LocalLegislationModel {
  final List<LocalLegislationItemModel> items;
  LocalLegislationModel(this.items);

  factory LocalLegislationModel.fromJson(Map<String, dynamic> json) =>
      _$LocalLegislationModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocalLegislationModelToJson(this);
}
