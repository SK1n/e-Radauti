import 'package:json_annotation/json_annotation.dart';

part 'leaders_item_model.g.dart';

@JsonSerializable()
class LeadersItemModel {
  final String? email;
  final String? function;
  final String? interests;
  final String? location;
  final String? name;
  @JsonKey(name: 'url_fb')
  final String? urlFb;
  @JsonKey(name: 'url_img')
  final String? urlImg;
  final String? wealth;

  const LeadersItemModel(
      {this.email,
      this.function,
      this.interests,
      this.location,
      this.name,
      this.urlFb,
      this.urlImg,
      this.wealth});

  factory LeadersItemModel.fromJson(Map<String, dynamic> json) =>
      _$LeadersItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$LeadersItemModelToJson(this);
}
