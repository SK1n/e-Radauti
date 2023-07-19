import 'package:freezed_annotation/freezed_annotation.dart';

part 'upsets_model.g.dart';
part 'upsets_model.freezed.dart';

@freezed
class UpsetsModel with _$UpsetsModel {
  const factory UpsetsModel(
      {@JsonKey(name: 'upsets', defaultValue: [])
      required List<UpsetsItemModel> items}) = _UpsetsModel;

  factory UpsetsModel.fromJson(Map<String, dynamic> json) =>
      _$UpsetsModelFromJson(json);
}

@freezed
class UpsetsItemModel with _$UpsetsItemModel {
  const factory UpsetsItemModel({
    @JsonKey(name: 'email', defaultValue: []) required List<String> emails,
    @JsonKey(name: 'phone', defaultValue: []) required List<String> phones,
    @JsonKey(name: 'title', defaultValue: '') required String title,
  }) = _UpsetsItemModel;

  factory UpsetsItemModel.fromJson(Map<String, dynamic> json) =>
      _$UpsetsItemModelFromJson(json);
}
