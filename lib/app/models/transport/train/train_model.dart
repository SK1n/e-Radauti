import 'package:freezed_annotation/freezed_annotation.dart';

part 'train_model.freezed.dart';
part 'train_model.g.dart';

@freezed
class TrainModel with _$TrainModel {
  const factory TrainModel(
      {@JsonKey(name: 'trains', defaultValue: [])
      required List<TrainItemModel> items}) = _TrainModel;

  factory TrainModel.fromJson(Map<String, dynamic> json) =>
      _$TrainModelFromJson(json);
}

@freezed
class TrainItemModel with _$TrainItemModel {
  const factory TrainItemModel({
    @JsonKey(name: 'train_nr', defaultValue: '') required String trainNr,
    @JsonKey(name: 'train_category', defaultValue: '')
    required String trainCategory,
    @JsonKey(name: 'stations', defaultValue: [])
    required List<StationsItemModel> stations,
  }) = _TrainItemModel;

  factory TrainItemModel.fromJson(Map<String, dynamic> json) =>
      _$TrainItemModelFromJson(json);
}

@freezed
class StationsItemModel with _$StationsItemModel {
  const factory StationsItemModel({
    @JsonKey(name: 'arrival_station', defaultValue: '')
    required String aStation,
    @JsonKey(name: 'arrival_time', defaultValue: '') required String aTime,
    @JsonKey(name: 'departure_station', defaultValue: '')
    required String dStation,
    @JsonKey(name: 'departure_time', defaultValue: '') required String dTime,
  }) = _StationsItemModel;

  factory StationsItemModel.fromJson(Map<String, dynamic> json) =>
      _$StationsItemModelFromJson(json);
}
