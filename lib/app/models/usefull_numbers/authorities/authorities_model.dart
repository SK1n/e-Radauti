import 'package:freezed_annotation/freezed_annotation.dart';

part 'authorities_model.g.dart';
part 'authorities_model.freezed.dart';

@freezed
class AuthoritiesModel with _$AuthoritiesModel {
  const factory AuthoritiesModel(
      {@JsonKey(name: 'authorities', defaultValue: [])
      required List<AuthoritiesItemModel> items}) = _AuthoritiesModel;

  factory AuthoritiesModel.fromJson(Map<String, dynamic> json) =>
      _$AuthoritiesModelFromJson(json);
}

@freezed
class AuthoritiesItemModel with _$AuthoritiesItemModel {
  const factory AuthoritiesItemModel({
    @JsonKey(name: 'email', defaultValue: []) required List<String> emails,
    @JsonKey(name: 'phone', defaultValue: []) required List<String> phones,
    @JsonKey(name: 'title', defaultValue: '') required String title,
  }) = _AuthoritiesItemModel;

  factory AuthoritiesItemModel.fromJson(Map<String, dynamic> json) =>
      _$AuthoritiesItemModelFromJson(json);
}
