import 'package:freezed_annotation/freezed_annotation.dart';

part 'public_model.g.dart';
part 'public_model.freezed.dart';

@freezed
class PublicModel with _$PublicModel {
  const factory PublicModel(
      {@JsonKey(name: 'public', defaultValue: [])
      required List<PublicItemModel> items}) = _PublicModel;

  factory PublicModel.fromJson(Map<String, dynamic> json) =>
      _$PublicModelFromJson(json);
}

@freezed
class PublicItemModel with _$PublicItemModel {
  const factory PublicItemModel({
    @JsonKey(name: 'email', defaultValue: []) required List<String> emails,
    @JsonKey(name: 'phone', defaultValue: []) required List<String> phones,
    @JsonKey(name: 'title', defaultValue: '') required String title,
  }) = _PublicItemModel;

  factory PublicItemModel.fromJson(Map<String, dynamic> json) =>
      _$PublicItemModelFromJson(json);
}
