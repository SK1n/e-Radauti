import 'package:json_annotation/json_annotation.dart';

part 'train_item_model.g.dart';

@JsonSerializable()
class TrainItemModel {
  @JsonKey(name: 'stations')
  final List<String>? stations;
  @JsonKey(name: 'time_table')
  final List<String>? timeTable;
  @JsonKey(name: 'title')
  final String? route;
  @JsonKey(name: 'train')
  final String? train;
  const TrainItemModel(this.stations, this.timeTable, this.route, this.train);

  factory TrainItemModel.fromJson(Map<String, dynamic> json) =>
      _$TrainItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrainItemModelToJson(this);
}
