import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_council_second_table_model.freezed.dart';
part 'local_council_second_table_model.g.dart';

@freezed
class LocalCouncilSecondTableModel with _$LocalCouncilSecondTableModel {
  const factory LocalCouncilSecondTableModel({
    required String name,
    required String? email,
    required String? phoneNumber,
  }) = _LocalCouncilSecondTableModel;

  factory LocalCouncilSecondTableModel.fromJson(Map<String, dynamic> json) =>
      _$LocalCouncilSecondTableModelFromJson(json);
}
