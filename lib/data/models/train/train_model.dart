import 'package:flutterapperadauti/data/models/train/train_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'train_model.g.dart';

@JsonSerializable()
class TrainModel {
  @JsonKey(name: 'train')
  final List<TrainItemModel>? trains;
  factory TrainModel.fromJson(Map<String, dynamic> json) =>
      _$TrainModelFromJson(json);

  const TrainModel(this.trains);

  Map<String, dynamic> toJson() => _$TrainModelToJson(this);
}
