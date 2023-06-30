import 'package:freezed_annotation/freezed_annotation.dart';

import 'events_item_model.dart';

part 'old_events_model.freezed.dart';
part 'old_events_model.g.dart';

@freezed
class OldEventsModel with _$OldEventsModel {
  const factory OldEventsModel(
    @JsonKey(name: 'oldEvents') List<EventsItemModel> list,
  ) = _OldEventsModel;

  factory OldEventsModel.fromJson(Map<String, dynamic> json) =>
      _$OldEventsModelFromJson(json);
}
