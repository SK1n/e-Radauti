import 'package:flutterapperadauti/data/models/leaders/leaders_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'leaders_model.g.dart';

@JsonSerializable()
class LeadersModel {
  @JsonKey(name: 'leaders')
  final List<LeadersItemModel> items;

  const LeadersModel(this.items);

  factory LeadersModel.fromJson(Map<String, dynamic> json) =>
      _$LeadersModelFromJson(json);
  Map<String, dynamic> toJson() => _$LeadersModelToJson(this);
}
