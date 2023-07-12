import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_council_model.freezed.dart';
part 'local_council_model.g.dart';

@freezed
class LocalCouncilModel with _$LocalCouncilModel {
  const factory LocalCouncilModel({
    @JsonKey(name: 'localcouncil', defaultValue: [])
    required List<LocalCouncilItemModel> items,
  }) = _LocalCouncilModel;

  factory LocalCouncilModel.fromJson(Map<String, dynamic> json) =>
      _$LocalCouncilModelFromJson(json);
}

@freezed
class LocalCouncilItemModel with _$LocalCouncilItemModel {
  const factory LocalCouncilItemModel({
    @JsonKey(name: 'name', defaultValue: '') required String firstname,
    @JsonKey(name: 'surname', defaultValue: '') required String surname,
    @JsonKey(name: 'url', defaultValue: '') required String imageUrl,
    @JsonKey(name: 'party', defaultValue: '') required String party,
    @JsonKey(name: 'email', defaultValue: '') required String email,
    @JsonKey(name: 'phone_number', defaultValue: '') required String tel,
    @JsonKey(name: 'function', defaultValue: '') required String function,
  }) = _LocalCouncilItemModel;

  factory LocalCouncilItemModel.fromJson(Map<String, dynamic> json) =>
      _$LocalCouncilItemModelFromJson(json);
}
