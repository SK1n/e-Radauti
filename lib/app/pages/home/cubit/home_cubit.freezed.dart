// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
// Last Decision
  PageState get dmState => throw _privateConstructorUsedError;
  DecisionModel? get dmData => throw _privateConstructorUsedError;
  String get dmErrorMessage => throw _privateConstructorUsedError; //Next Event
  PageState get eventState => throw _privateConstructorUsedError;
  EventModel? get eventData => throw _privateConstructorUsedError;
  String get eventError =>
      throw _privateConstructorUsedError; // Nums of reports
  PageState get numsOfReportsState => throw _privateConstructorUsedError;
  dynamic get numsOfReports => throw _privateConstructorUsedError;
  String get numsOfReportsError =>
      throw _privateConstructorUsedError; // Is user annonymous
  dynamic get isAnnonymous => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {PageState dmState,
      DecisionModel? dmData,
      String dmErrorMessage,
      PageState eventState,
      EventModel? eventData,
      String eventError,
      PageState numsOfReportsState,
      dynamic numsOfReports,
      String numsOfReportsError,
      dynamic isAnnonymous});

  $DecisionModelCopyWith<$Res>? get dmData;
  $EventModelCopyWith<$Res>? get eventData;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dmState = null,
    Object? dmData = freezed,
    Object? dmErrorMessage = null,
    Object? eventState = null,
    Object? eventData = freezed,
    Object? eventError = null,
    Object? numsOfReportsState = null,
    Object? numsOfReports = freezed,
    Object? numsOfReportsError = null,
    Object? isAnnonymous = freezed,
  }) {
    return _then(_value.copyWith(
      dmState: null == dmState
          ? _value.dmState
          : dmState // ignore: cast_nullable_to_non_nullable
              as PageState,
      dmData: freezed == dmData
          ? _value.dmData
          : dmData // ignore: cast_nullable_to_non_nullable
              as DecisionModel?,
      dmErrorMessage: null == dmErrorMessage
          ? _value.dmErrorMessage
          : dmErrorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      eventState: null == eventState
          ? _value.eventState
          : eventState // ignore: cast_nullable_to_non_nullable
              as PageState,
      eventData: freezed == eventData
          ? _value.eventData
          : eventData // ignore: cast_nullable_to_non_nullable
              as EventModel?,
      eventError: null == eventError
          ? _value.eventError
          : eventError // ignore: cast_nullable_to_non_nullable
              as String,
      numsOfReportsState: null == numsOfReportsState
          ? _value.numsOfReportsState
          : numsOfReportsState // ignore: cast_nullable_to_non_nullable
              as PageState,
      numsOfReports: freezed == numsOfReports
          ? _value.numsOfReports
          : numsOfReports // ignore: cast_nullable_to_non_nullable
              as dynamic,
      numsOfReportsError: null == numsOfReportsError
          ? _value.numsOfReportsError
          : numsOfReportsError // ignore: cast_nullable_to_non_nullable
              as String,
      isAnnonymous: freezed == isAnnonymous
          ? _value.isAnnonymous
          : isAnnonymous // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DecisionModelCopyWith<$Res>? get dmData {
    if (_value.dmData == null) {
      return null;
    }

    return $DecisionModelCopyWith<$Res>(_value.dmData!, (value) {
      return _then(_value.copyWith(dmData: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EventModelCopyWith<$Res>? get eventData {
    if (_value.eventData == null) {
      return null;
    }

    return $EventModelCopyWith<$Res>(_value.eventData!, (value) {
      return _then(_value.copyWith(eventData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_HomeStateCopyWith(
          _$_HomeState value, $Res Function(_$_HomeState) then) =
      __$$_HomeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PageState dmState,
      DecisionModel? dmData,
      String dmErrorMessage,
      PageState eventState,
      EventModel? eventData,
      String eventError,
      PageState numsOfReportsState,
      dynamic numsOfReports,
      String numsOfReportsError,
      dynamic isAnnonymous});

  @override
  $DecisionModelCopyWith<$Res>? get dmData;
  @override
  $EventModelCopyWith<$Res>? get eventData;
}

/// @nodoc
class __$$_HomeStateCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_HomeState>
    implements _$$_HomeStateCopyWith<$Res> {
  __$$_HomeStateCopyWithImpl(
      _$_HomeState _value, $Res Function(_$_HomeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dmState = null,
    Object? dmData = freezed,
    Object? dmErrorMessage = null,
    Object? eventState = null,
    Object? eventData = freezed,
    Object? eventError = null,
    Object? numsOfReportsState = null,
    Object? numsOfReports = freezed,
    Object? numsOfReportsError = null,
    Object? isAnnonymous = freezed,
  }) {
    return _then(_$_HomeState(
      dmState: null == dmState
          ? _value.dmState
          : dmState // ignore: cast_nullable_to_non_nullable
              as PageState,
      dmData: freezed == dmData
          ? _value.dmData
          : dmData // ignore: cast_nullable_to_non_nullable
              as DecisionModel?,
      dmErrorMessage: null == dmErrorMessage
          ? _value.dmErrorMessage
          : dmErrorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      eventState: null == eventState
          ? _value.eventState
          : eventState // ignore: cast_nullable_to_non_nullable
              as PageState,
      eventData: freezed == eventData
          ? _value.eventData
          : eventData // ignore: cast_nullable_to_non_nullable
              as EventModel?,
      eventError: null == eventError
          ? _value.eventError
          : eventError // ignore: cast_nullable_to_non_nullable
              as String,
      numsOfReportsState: null == numsOfReportsState
          ? _value.numsOfReportsState
          : numsOfReportsState // ignore: cast_nullable_to_non_nullable
              as PageState,
      numsOfReports:
          freezed == numsOfReports ? _value.numsOfReports! : numsOfReports,
      numsOfReportsError: null == numsOfReportsError
          ? _value.numsOfReportsError
          : numsOfReportsError // ignore: cast_nullable_to_non_nullable
              as String,
      isAnnonymous:
          freezed == isAnnonymous ? _value.isAnnonymous! : isAnnonymous,
    ));
  }
}

/// @nodoc

class _$_HomeState implements _HomeState {
  const _$_HomeState(
      {this.dmState = PageState.initial,
      this.dmData,
      this.dmErrorMessage = '',
      this.eventState = PageState.initial,
      this.eventData,
      this.eventError = '',
      this.numsOfReportsState = PageState.initial,
      this.numsOfReports = 0,
      this.numsOfReportsError = '',
      this.isAnnonymous = false});

// Last Decision
  @override
  @JsonKey()
  final PageState dmState;
  @override
  final DecisionModel? dmData;
  @override
  @JsonKey()
  final String dmErrorMessage;
//Next Event
  @override
  @JsonKey()
  final PageState eventState;
  @override
  final EventModel? eventData;
  @override
  @JsonKey()
  final String eventError;
// Nums of reports
  @override
  @JsonKey()
  final PageState numsOfReportsState;
  @override
  @JsonKey()
  final dynamic numsOfReports;
  @override
  @JsonKey()
  final String numsOfReportsError;
// Is user annonymous
  @override
  @JsonKey()
  final dynamic isAnnonymous;

  @override
  String toString() {
    return 'HomeState(dmState: $dmState, dmData: $dmData, dmErrorMessage: $dmErrorMessage, eventState: $eventState, eventData: $eventData, eventError: $eventError, numsOfReportsState: $numsOfReportsState, numsOfReports: $numsOfReports, numsOfReportsError: $numsOfReportsError, isAnnonymous: $isAnnonymous)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeState &&
            (identical(other.dmState, dmState) || other.dmState == dmState) &&
            (identical(other.dmData, dmData) || other.dmData == dmData) &&
            (identical(other.dmErrorMessage, dmErrorMessage) ||
                other.dmErrorMessage == dmErrorMessage) &&
            (identical(other.eventState, eventState) ||
                other.eventState == eventState) &&
            (identical(other.eventData, eventData) ||
                other.eventData == eventData) &&
            (identical(other.eventError, eventError) ||
                other.eventError == eventError) &&
            (identical(other.numsOfReportsState, numsOfReportsState) ||
                other.numsOfReportsState == numsOfReportsState) &&
            const DeepCollectionEquality()
                .equals(other.numsOfReports, numsOfReports) &&
            (identical(other.numsOfReportsError, numsOfReportsError) ||
                other.numsOfReportsError == numsOfReportsError) &&
            const DeepCollectionEquality()
                .equals(other.isAnnonymous, isAnnonymous));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      dmState,
      dmData,
      dmErrorMessage,
      eventState,
      eventData,
      eventError,
      numsOfReportsState,
      const DeepCollectionEquality().hash(numsOfReports),
      numsOfReportsError,
      const DeepCollectionEquality().hash(isAnnonymous));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      __$$_HomeStateCopyWithImpl<_$_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {final PageState dmState,
      final DecisionModel? dmData,
      final String dmErrorMessage,
      final PageState eventState,
      final EventModel? eventData,
      final String eventError,
      final PageState numsOfReportsState,
      final dynamic numsOfReports,
      final String numsOfReportsError,
      final dynamic isAnnonymous}) = _$_HomeState;

  @override // Last Decision
  PageState get dmState;
  @override
  DecisionModel? get dmData;
  @override
  String get dmErrorMessage;
  @override //Next Event
  PageState get eventState;
  @override
  EventModel? get eventData;
  @override
  String get eventError;
  @override // Nums of reports
  PageState get numsOfReportsState;
  @override
  dynamic get numsOfReports;
  @override
  String get numsOfReportsError;
  @override // Is user annonymous
  dynamic get isAnnonymous;
  @override
  @JsonKey(ignore: true)
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
