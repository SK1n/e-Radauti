import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'events_item_model.dart';

part 'old_events_model.g.dart';

@JsonSerializable()
class OldEventsModel extends Equatable {
  @JsonKey(name: 'oldEvents')
  final List<EventsItemModel> list;

  const OldEventsModel(this.list);

  factory OldEventsModel.fromJson(Map<String, dynamic> json) =>
      _$OldEventsModelFromJson(json);
  Map<String, dynamic> toJson() => _$OldEventsModelToJson(this);

  @override
  List<Object?> get props => [list];
}
