import 'package:flutterapperadauti/data/models/train/train_item_model.dart';
import 'package:flutterapperadauti/data/models/usefull_numbers/usefull_numbers_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'usefull_numbers_model.g.dart';

@JsonSerializable()
class UsefullNumbersModel {
  @JsonKey(name: 'authorities')
  final List<TrainItemModel>? localAuthorities;
  @JsonKey(name: 'public')
  final List<UsefullNumbersItemModel> publicInstitutions;
  @JsonKey(name: 'upsets')
  final List<UsefullNumbersItemModel> localUpsets;
  const UsefullNumbersModel(
      this.localAuthorities, this.publicInstitutions, this.localUpsets);

  factory UsefullNumbersModel.fromJson(Map<String, dynamic> json) =>
      _$UsefullNumbersModelFromJson(json);

  Map<String, dynamic> toJson() => _$UsefullNumbersModelToJson(this);
}
