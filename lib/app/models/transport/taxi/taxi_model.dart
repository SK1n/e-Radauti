import 'package:freezed_annotation/freezed_annotation.dart';

part 'taxi_model.g.dart';
part 'taxi_model.freezed.dart';

@freezed
class TaxiModel with _$TaxiModel {
  const factory TaxiModel(
      {@JsonKey(name: 'taxi', defaultValue: [])
      required List<TaxiItemModel> items}) = _TaxiModel;

  factory TaxiModel.fromJson(Map<String, dynamic> json) =>
      _$TaxiModelFromJson(json);
}

@freezed
class TaxiItemModel with _$TaxiItemModel {
  const factory TaxiItemModel({
    @JsonKey(name: 'car_type', defaultValue: '') required String model,
    @JsonKey(name: 'driver_name', defaultValue: '') required String name,
    @JsonKey(name: 'image_url', defaultValue: '') required String url,
    @JsonKey(name: 'phone_number', defaultValue: '') required String tel,
    @JsonKey(name: 'plate_number', defaultValue: '') required String plate,
  }) = _TaxiItemModel;

  factory TaxiItemModel.fromJson(Map<String, dynamic> json) =>
      _$TaxiItemModelFromJson(json);
}
