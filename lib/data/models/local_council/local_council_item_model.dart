import 'package:json_annotation/json_annotation.dart';

part 'local_council_item_model.g.dart';

@JsonSerializable()
class LocalCouncilItemModel {
  final String email;
  final String function;
  final String name;
  final String party;
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  String url;

  LocalCouncilItemModel(
    this.email,
    this.function,
    this.name,
    this.party,
    this.phoneNumber,
    this.url,
  );

  factory LocalCouncilItemModel.fromJson(Map<String, dynamic> json) =>
      _$LocalCouncilItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocalCouncilItemModelToJson(this);
}
