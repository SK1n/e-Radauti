import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'events_item_model.dart';

part 'new_events_model.g.dart';

@JsonSerializable()
class NewEventsModel extends Equatable {
  @JsonKey(name: 'events')
  final List<EventsItemModel> list;

  const NewEventsModel(this.list);

  factory NewEventsModel.fromJson(Map<String, dynamic> json) =>
      _$NewEventsModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewEventsModelToJson(this);

  @override
  List<Object?> get props => [list];
}
