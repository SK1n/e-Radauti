import 'package:json_annotation/json_annotation.dart';
import 'markers_model.dart';

part 'notice_problem_map_marker_model.g.dart';

@JsonSerializable()
class NoticeProblemMapMarkerModel {
  List<MarkersModel>? markers;

  NoticeProblemMapMarkerModel({this.markers});

  factory NoticeProblemMapMarkerModel.fromJson(Map<String, dynamic> json) =>
      _$NoticeProblemMapMarkerModelFromJson(json);

  Map<String, dynamic> toJson() => _$NoticeProblemMapMarkerModelToJson(this);
}
