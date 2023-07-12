import 'package:freezed_annotation/freezed_annotation.dart';

part 'volunteering_model.freezed.dart';
part 'volunteering_model.g.dart';

@freezed
class VolunteeringModel with _$VolunteeringModel {
  const factory VolunteeringModel({
    @JsonKey(name: 'volunteering', defaultValue: [])
    required List<VolunteeringItemModel> items,
  }) = _VolunteeringModel;

  factory VolunteeringModel.fromJson(Map<String, dynamic> json) =>
      _$VolunteeringModelFromJson(json);
}

@freezed
class VolunteeringItemModel with _$VolunteeringItemModel {
  const factory VolunteeringItemModel({
    @JsonKey(name: 'email', defaultValue: '') required String email,
    @JsonKey(name: 'image', defaultValue: '') required String image,
    @JsonKey(name: 'name', defaultValue: '') required String name,
    @JsonKey(name: 'phone_number', defaultValue: '')
    required String phoneNumber,
    @JsonKey(name: 'website', defaultValue: '') required String website,
  }) = _VolunteeringItemModel;

  factory VolunteeringItemModel.fromJson(Map<String, dynamic> json) =>
      _$VolunteeringItemModelFromJson(json);
}
