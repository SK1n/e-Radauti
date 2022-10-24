import 'package:flutterapperadauti/data/models/e_radauti_website/params_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'match_model.g.dart';

@JsonSerializable()
class MatchModel {
  @JsonKey(name: 'path')
  final String? path;
  @JsonKey(name: 'url')
  final String? url;
  @JsonKey(name: 'isExact')
  final bool? isExact;
  @JsonKey(name: 'params')
  final ParamsModel? params;

  const MatchModel(this.path, this.url, this.isExact, this.params);

  factory MatchModel.fromJson(Map<String, dynamic> json) =>
      _$MatchModelFromJson(json);

  Map<String, dynamic> toJson() => _$MatchModelToJson(this);
}
