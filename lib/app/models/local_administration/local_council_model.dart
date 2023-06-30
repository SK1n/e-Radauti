import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_council_model.freezed.dart';
part 'local_council_model.g.dart';

@freezed
class LocalCouncilModel with _$LocalCouncilModel {
  const factory LocalCouncilModel({
    required String name,
    required String imageUrl,
    required String party,
    required List<String> wealth,
    required List<String> interests,
    required String? email,
    required String? phoneNumber,
    required String fbUrl,
  }) = _LocalCouncilModel;

  factory LocalCouncilModel.fromJson(Map<String, dynamic> json) =>
      _$LocalCouncilModelFromJson(json);
}
