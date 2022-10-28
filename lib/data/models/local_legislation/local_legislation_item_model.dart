import 'package:json_annotation/json_annotation.dart';

part 'local_legislation_item_model.g.dart';

@JsonSerializable()
class LocalLegislationItemModel {
  @JsonKey(name: 'an')
  final String? year;
  @JsonKey(name: 'link')
  final String? link;
  @JsonKey(name: 'title')
  final String? title;

  const LocalLegislationItemModel(this.year, this.link, this.title);

  factory LocalLegislationItemModel.fromJson(Map<String, dynamic> json) =>
      _$LocalLegislationItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocalLegislationItemModelToJson(this);
}
