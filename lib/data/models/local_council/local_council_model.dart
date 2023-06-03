import 'package:flutterapperadauti/data/models/local_council/local_council_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'local_council_model.g.dart';

@JsonSerializable()
class LocalCouncilModel {
  @JsonKey(name: 'localcouncil')
  final List<LocalCouncilItemModel> items;

  const LocalCouncilModel(this.items);

  factory LocalCouncilModel.fromJson(Map<String, dynamic> json) =>
      _$LocalCouncilModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocalCouncilModelToJson(this);
}
