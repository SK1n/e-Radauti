import 'package:freezed_annotation/freezed_annotation.dart';

part 'decision_model.freezed.dart';
part 'decision_model.g.dart';

@freezed
class DecisionModel with _$DecisionModel {
  const factory DecisionModel({
    required String title,
    required String url,
    required String year,
  }) = _DecisionModel;

  factory DecisionModel.fromJson(Map<String, dynamic> json) =>
      _$DecisionModelFromJson(json);
}
