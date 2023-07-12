import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_council_leaders_model.freezed.dart';
part 'local_council_leaders_model.g.dart';

@freezed
class LocalCouncilLeadersModel with _$LocalCouncilLeadersModel {
  const factory LocalCouncilLeadersModel({
    @JsonKey(name: 'leaders', defaultValue: [])
    required List<LocalCouncilLeadersItemModel> items,
  }) = _LocalCouncilLeadersModel;

  factory LocalCouncilLeadersModel.fromJson(Map<String, dynamic> json) =>
      _$LocalCouncilLeadersModelFromJson(json);
}

@freezed
class LocalCouncilLeadersItemModel with _$LocalCouncilLeadersItemModel {
  const factory LocalCouncilLeadersItemModel({
    @JsonKey(name: 'first_name', defaultValue: '') required String firstName,
    @JsonKey(name: 'surname', defaultValue: '') required String surname,
    @JsonKey(name: 'url_img', defaultValue: '') required String imageUrl,
    @JsonKey(name: 'url_fb', defaultValue: '') required String fbUrl,
    @JsonKey(name: 'email', defaultValue: '') required String email,
    @JsonKey(name: 'function', defaultValue: '') required String function,
    @JsonKey(name: 'interests', defaultValue: '') required String interests,
    @JsonKey(name: 'wealth', defaultValue: '') required String wealth,
    @JsonKey(name: 'location', defaultValue: '') required String location,
  }) = _LocalCouncilLeadersItemModel;

  factory LocalCouncilLeadersItemModel.fromJson(Map<String, dynamic> json) =>
      _$LocalCouncilLeadersItemModelFromJson(json);
}
