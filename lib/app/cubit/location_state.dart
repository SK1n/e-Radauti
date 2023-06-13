part of 'location_cubit.dart';

enum LocationStatus { initial, loading, success, failure }

@freezed
class LocationState with _$LocationState {
  const factory LocationState({
    Position? position,
    LocationStatus? status,
  }) = _LocationState;
}
