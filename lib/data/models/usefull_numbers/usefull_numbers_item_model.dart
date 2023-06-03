import 'package:flutterapperadauti/data/models/train/train_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'usefull_numbers_item_model.g.dart';

@JsonSerializable()
class UsefullNumbersItemModel {
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'phone')
  final List<String> phoneNumbers;
  @JsonKey(name: 'title')
  final String title;
  const UsefullNumbersItemModel(this.email, this.phoneNumbers, this.title);

  factory UsefullNumbersItemModel.fromJson(Map<String, dynamic> json) =>
      _$UsefullNumbersItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$UsefullNumbersItemModelToJson(this);
}
