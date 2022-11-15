import 'package:flutterapperadauti/data/models/local_authorities/local_authorities_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'local_authorities_model.g.dart';

@JsonSerializable()
class LocalAuthoritiesModel {
  @JsonKey(name: 'authorities')
  final List<LocalAuthoritiesItemModel>? items;

  const LocalAuthoritiesModel(this.items);

  factory LocalAuthoritiesModel.fromJson(Map<String, dynamic> json) =>
      _$LocalAuthoritiesModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocalAuthoritiesModelToJson(this);
}
