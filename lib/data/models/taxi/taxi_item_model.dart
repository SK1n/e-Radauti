import 'package:json_annotation/json_annotation.dart';

part 'taxi_item_model.g.dart';

@JsonSerializable()
class TaxiItemModel {
  @JsonKey(name: 'car_type')
  final String? carType;
  @JsonKey(name: 'driver_name')
  final String? driverName;
  @JsonKey(name: 'image_url')
  final String? image;
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @JsonKey(name: 'plate_number')
  final String? plateNumber;

  const TaxiItemModel(this.carType, this.driverName, this.image,
      this.phoneNumber, this.plateNumber);

  factory TaxiItemModel.fromJson(Map<String, dynamic> json) =>
      _$TaxiItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaxiItemModelToJson(this);
}
