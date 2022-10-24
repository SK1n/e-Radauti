import 'package:flutterapperadauti/data/models/e_radauti_website/context_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'e_radauti_model.g.dart';

@JsonSerializable()
class ERadautiModel {
  @JsonKey(name: 'context')
  final ERContextModel? context;

  const ERadautiModel(this.context);

  factory ERadautiModel.fromJson(Map<String, dynamic> json) =>
      _$ERadautiModelFromJson(json);

  Map<String, dynamic> toJson() => _$ERadautiModelToJson(this);
}
