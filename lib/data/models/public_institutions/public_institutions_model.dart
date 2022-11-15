import 'package:flutterapperadauti/data/models/public_institutions/public_institutions_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'public_institutions_model.g.dart';

@JsonSerializable()
class PublicInstitutionsModel {
  @JsonKey(name: 'public')
  final List<PublicInstitutionsItemModel>? items;

  const PublicInstitutionsModel(this.items);

  factory PublicInstitutionsModel.fromJson(Map<String, dynamic> json) =>
      _$PublicInstitutionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PublicInstitutionsModelToJson(this);
}
