import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_council_first_table_model.freezed.dart';
part 'local_council_first_table_model.g.dart';

@freezed
class LocalCouncilFirstTableModel with _$LocalCouncilFirstTableModel {
  const factory LocalCouncilFirstTableModel({
    required String name,
    required String imageUrl,
    required String party,
    required List<String> wealth,
    required List<String> interests,
    required String fbUrl,
  }) = _LocalCouncilFirstTableModel;

  factory LocalCouncilFirstTableModel.fromJson(Map<String, dynamic> json) =>
      _$LocalCouncilFirstTableModelFromJson(json);
}
