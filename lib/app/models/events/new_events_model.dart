import 'package:freezed_annotation/freezed_annotation.dart';

import 'events_item_model.dart';

part 'new_events_model.freezed.dart';
part 'new_events_model.g.dart';

@freezed
class NewEventsModel with _$NewEventsModel {
  const factory NewEventsModel(
    @JsonKey(name: 'events', defaultValue: []) List<EventsItemModel> list,
  ) = _NewEventsModel;

  factory NewEventsModel.fromJson(Map<String, dynamic> json) =>
      _$NewEventsModelFromJson(json);
}
