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
  List<EventsItemModel>? get newEvents => throw _privateConstructorUsedError;
  FirestoreSubmissionStatus get newEventsStatus =>
      throw _privateConstructorUsedError;
  List<EventsItemModel>? get oldEvents => throw _privateConstructorUsedError;
  FirestoreSubmissionStatus get oldEventsStatus =>
      throw _privateConstructorUsedError;
  List<EventsItemModel>? get favoritesEvents =>
      throw _privateConstructorUsedError;
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
      {List<EventsItemModel>? newEvents,
      FirestoreSubmissionStatus newEventsStatus,
      List<EventsItemModel>? oldEvents,
      FirestoreSubmissionStatus oldEventsStatus,
      List<EventsItemModel>? favoritesEvents,
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
    Object? newEvents = freezed,
    Object? newEventsStatus = null,
    Object? oldEvents = freezed,
    Object? oldEventsStatus = null,
    Object? favoritesEvents = freezed,
    Object? floorStatus = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      newEvents: freezed == newEvents
          ? _value.newEvents
          : newEvents // ignore: cast_nullable_to_non_nullable
              as List<EventsItemModel>?,
      newEventsStatus: null == newEventsStatus
          ? _value.newEventsStatus
          : newEventsStatus // ignore: cast_nullable_to_non_nullable
              as FirestoreSubmissionStatus,
      oldEvents: freezed == oldEvents
          ? _value.oldEvents
          : oldEvents // ignore: cast_nullable_to_non_nullable
              as List<EventsItemModel>?,
      oldEventsStatus: null == oldEventsStatus
          ? _value.oldEventsStatus
          : oldEventsStatus // ignore: cast_nullable_to_non_nullable
              as FirestoreSubmissionStatus,
      favoritesEvents: freezed == favoritesEvents
          ? _value.favoritesEvents
          : favoritesEvents // ignore: cast_nullable_to_non_nullable
              as List<EventsItemModel>?,
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
      {List<EventsItemModel>? newEvents,
      FirestoreSubmissionStatus newEventsStatus,
      List<EventsItemModel>? oldEvents,
      FirestoreSubmissionStatus oldEventsStatus,
      List<EventsItemModel>? favoritesEvents,
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
    Object? newEvents = freezed,
    Object? newEventsStatus = null,
    Object? oldEvents = freezed,
    Object? oldEventsStatus = null,
    Object? favoritesEvents = freezed,
    Object? floorStatus = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_EventsState(
      newEvents: freezed == newEvents
          ? _value._newEvents
          : newEvents // ignore: cast_nullable_to_non_nullable
              as List<EventsItemModel>?,
      newEventsStatus: null == newEventsStatus
          ? _value.newEventsStatus
          : newEventsStatus // ignore: cast_nullable_to_non_nullable
              as FirestoreSubmissionStatus,
      oldEvents: freezed == oldEvents
          ? _value._oldEvents
          : oldEvents // ignore: cast_nullable_to_non_nullable
              as List<EventsItemModel>?,
      oldEventsStatus: null == oldEventsStatus
          ? _value.oldEventsStatus
          : oldEventsStatus // ignore: cast_nullable_to_non_nullable
              as FirestoreSubmissionStatus,
      favoritesEvents: freezed == favoritesEvents
          ? _value._favoritesEvents
          : favoritesEvents // ignore: cast_nullable_to_non_nullable
              as List<EventsItemModel>?,
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
      {final List<EventsItemModel>? newEvents,
      this.newEventsStatus = FirestoreSubmissionStatus.initial,
      final List<EventsItemModel>? oldEvents,
      this.oldEventsStatus = FirestoreSubmissionStatus.initial,
      final List<EventsItemModel>? favoritesEvents,
      this.floorStatus = FloorRepositoryStatus.initial,
      this.errorMessage})
      : _newEvents = newEvents,
        _oldEvents = oldEvents,
        _favoritesEvents = favoritesEvents;

  final List<EventsItemModel>? _newEvents;
  @override
  List<EventsItemModel>? get newEvents {
    final value = _newEvents;
    if (value == null) return null;
    if (_newEvents is EqualUnmodifiableListView) return _newEvents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final FirestoreSubmissionStatus newEventsStatus;
  final List<EventsItemModel>? _oldEvents;
  @override
  List<EventsItemModel>? get oldEvents {
    final value = _oldEvents;
    if (value == null) return null;
    if (_oldEvents is EqualUnmodifiableListView) return _oldEvents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final FirestoreSubmissionStatus oldEventsStatus;
  final List<EventsItemModel>? _favoritesEvents;
  @override
  List<EventsItemModel>? get favoritesEvents {
    final value = _favoritesEvents;
    if (value == null) return null;
    if (_favoritesEvents is EqualUnmodifiableListView) return _favoritesEvents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final FloorRepositoryStatus floorStatus;
  @override
  final String? errorMessage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EventsState(newEvents: $newEvents, newEventsStatus: $newEventsStatus, oldEvents: $oldEvents, oldEventsStatus: $oldEventsStatus, favoritesEvents: $favoritesEvents, floorStatus: $floorStatus, errorMessage: $errorMessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EventsState'))
      ..add(DiagnosticsProperty('newEvents', newEvents))
      ..add(DiagnosticsProperty('newEventsStatus', newEventsStatus))
      ..add(DiagnosticsProperty('oldEvents', oldEvents))
      ..add(DiagnosticsProperty('oldEventsStatus', oldEventsStatus))
      ..add(DiagnosticsProperty('favoritesEvents', favoritesEvents))
      ..add(DiagnosticsProperty('floorStatus', floorStatus))
      ..add(DiagnosticsProperty('errorMessage', errorMessage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventsState &&
            const DeepCollectionEquality()
                .equals(other._newEvents, _newEvents) &&
            (identical(other.newEventsStatus, newEventsStatus) ||
                other.newEventsStatus == newEventsStatus) &&
            const DeepCollectionEquality()
                .equals(other._oldEvents, _oldEvents) &&
            (identical(other.oldEventsStatus, oldEventsStatus) ||
                other.oldEventsStatus == oldEventsStatus) &&
            const DeepCollectionEquality()
                .equals(other._favoritesEvents, _favoritesEvents) &&
            (identical(other.floorStatus, floorStatus) ||
                other.floorStatus == floorStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_newEvents),
      newEventsStatus,
      const DeepCollectionEquality().hash(_oldEvents),
      oldEventsStatus,
      const DeepCollectionEquality().hash(_favoritesEvents),
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
      {final List<EventsItemModel>? newEvents,
      final FirestoreSubmissionStatus newEventsStatus,
      final List<EventsItemModel>? oldEvents,
      final FirestoreSubmissionStatus oldEventsStatus,
      final List<EventsItemModel>? favoritesEvents,
      final FloorRepositoryStatus floorStatus,
      final String? errorMessage}) = _$_EventsState;

  @override
  List<EventsItemModel>? get newEvents;
  @override
  FirestoreSubmissionStatus get newEventsStatus;
  @override
  List<EventsItemModel>? get oldEvents;
  @override
  FirestoreSubmissionStatus get oldEventsStatus;
  @override
  List<EventsItemModel>? get favoritesEvents;
  @override
  FloorRepositoryStatus get floorStatus;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_EventsStateCopyWith<_$_EventsState> get copyWith =>
      throw _privateConstructorUsedError;
}
