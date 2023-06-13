// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'events_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EventsState {
  List<EventsItemModel>? get events => throw _privateConstructorUsedError;
  FirestoreSubmissionStatus get status => throw _privateConstructorUsedError;
  FloorRepositoryStatus get floorStatus => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventsStateCopyWith<EventsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventsStateCopyWith<$Res> {
  factory $EventsStateCopyWith(
          EventsState value, $Res Function(EventsState) then) =
      _$EventsStateCopyWithImpl<$Res, EventsState>;
  @useResult
  $Res call(
      {List<EventsItemModel>? events,
      FirestoreSubmissionStatus status,
      FloorRepositoryStatus floorStatus,
      String? errorMessage});
}

/// @nodoc
class _$EventsStateCopyWithImpl<$Res, $Val extends EventsState>
    implements $EventsStateCopyWith<$Res> {
  _$EventsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = freezed,
    Object? status = null,
    Object? floorStatus = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      events: freezed == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventsItemModel>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FirestoreSubmissionStatus,
      floorStatus: null == floorStatus
          ? _value.floorStatus
          : floorStatus // ignore: cast_nullable_to_non_nullable
              as FloorRepositoryStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EventsStateCopyWith<$Res>
    implements $EventsStateCopyWith<$Res> {
  factory _$$_EventsStateCopyWith(
          _$_EventsState value, $Res Function(_$_EventsState) then) =
      __$$_EventsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<EventsItemModel>? events,
      FirestoreSubmissionStatus status,
      FloorRepositoryStatus floorStatus,
      String? errorMessage});
}

/// @nodoc
class __$$_EventsStateCopyWithImpl<$Res>
    extends _$EventsStateCopyWithImpl<$Res, _$_EventsState>
    implements _$$_EventsStateCopyWith<$Res> {
  __$$_EventsStateCopyWithImpl(
      _$_EventsState _value, $Res Function(_$_EventsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = freezed,
    Object? status = null,
    Object? floorStatus = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_EventsState(
      events: freezed == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventsItemModel>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FirestoreSubmissionStatus,
      floorStatus: null == floorStatus
          ? _value.floorStatus
          : floorStatus // ignore: cast_nullable_to_non_nullable
              as FloorRepositoryStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_EventsState with DiagnosticableTreeMixin implements _EventsState {
  const _$_EventsState(
      {final List<EventsItemModel>? events,
      this.status = FirestoreSubmissionStatus.initial,
      this.floorStatus = FloorRepositoryStatus.initial,
      this.errorMessage})
      : _events = events;

  final List<EventsItemModel>? _events;
  @override
  List<EventsItemModel>? get events {
    final value = _events;
    if (value == null) return null;
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final FirestoreSubmissionStatus status;
  @override
  @JsonKey()
  final FloorRepositoryStatus floorStatus;
  @override
  final String? errorMessage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EventsState(events: $events, status: $status, floorStatus: $floorStatus, errorMessage: $errorMessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EventsState'))
      ..add(DiagnosticsProperty('events', events))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('floorStatus', floorStatus))
      ..add(DiagnosticsProperty('errorMessage', errorMessage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventsState &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.floorStatus, floorStatus) ||
                other.floorStatus == floorStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_events),
      status,
      floorStatus,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventsStateCopyWith<_$_EventsState> get copyWith =>
      __$$_EventsStateCopyWithImpl<_$_EventsState>(this, _$identity);
}

abstract class _EventsState implements EventsState {
  const factory _EventsState(
      {final List<EventsItemModel>? events,
      final FirestoreSubmissionStatus status,
      final FloorRepositoryStatus floorStatus,
      final String? errorMessage}) = _$_EventsState;

  @override
  List<EventsItemModel>? get events;
  @override
  FirestoreSubmissionStatus get status;
  @override
  FloorRepositoryStatus get floorStatus;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_EventsStateCopyWith<_$_EventsState> get copyWith =>
      throw _privateConstructorUsedError;
}
