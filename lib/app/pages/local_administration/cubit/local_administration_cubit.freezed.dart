// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_administration_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LocalAdministrationState {
//Latest NEWS
  PageState get newsState => throw _privateConstructorUsedError;
  DecisionModel? get latestDecision => throw _privateConstructorUsedError;
  String get errorMessageNews =>
      throw _privateConstructorUsedError; //Local decisions
  PageState get localDecisionState => throw _privateConstructorUsedError;
  List<DecisionModel> get localDecisions => throw _privateConstructorUsedError;
  List<DecisionModel> get fillteredLocalDecisions =>
      throw _privateConstructorUsedError;
  String get errorMessageLocalDecisions =>
      throw _privateConstructorUsedError; // Local council team
  PageState get localCouncilTeamState => throw _privateConstructorUsedError;
  List<LocalCouncilItemModel> get localCouncilTeamList =>
      throw _privateConstructorUsedError;
  String get errorMessageLocalCouncilTeam => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocalAdministrationStateCopyWith<LocalAdministrationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalAdministrationStateCopyWith<$Res> {
  factory $LocalAdministrationStateCopyWith(LocalAdministrationState value,
          $Res Function(LocalAdministrationState) then) =
      _$LocalAdministrationStateCopyWithImpl<$Res, LocalAdministrationState>;
  @useResult
  $Res call(
      {PageState newsState,
      DecisionModel? latestDecision,
      String errorMessageNews,
      PageState localDecisionState,
      List<DecisionModel> localDecisions,
      List<DecisionModel> fillteredLocalDecisions,
      String errorMessageLocalDecisions,
      PageState localCouncilTeamState,
      List<LocalCouncilItemModel> localCouncilTeamList,
      String errorMessageLocalCouncilTeam});

  $DecisionModelCopyWith<$Res>? get latestDecision;
}

/// @nodoc
class _$LocalAdministrationStateCopyWithImpl<$Res,
        $Val extends LocalAdministrationState>
    implements $LocalAdministrationStateCopyWith<$Res> {
  _$LocalAdministrationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newsState = null,
    Object? latestDecision = freezed,
    Object? errorMessageNews = null,
    Object? localDecisionState = null,
    Object? localDecisions = null,
    Object? fillteredLocalDecisions = null,
    Object? errorMessageLocalDecisions = null,
    Object? localCouncilTeamState = null,
    Object? localCouncilTeamList = null,
    Object? errorMessageLocalCouncilTeam = null,
  }) {
    return _then(_value.copyWith(
      newsState: null == newsState
          ? _value.newsState
          : newsState // ignore: cast_nullable_to_non_nullable
              as PageState,
      latestDecision: freezed == latestDecision
          ? _value.latestDecision
          : latestDecision // ignore: cast_nullable_to_non_nullable
              as DecisionModel?,
      errorMessageNews: null == errorMessageNews
          ? _value.errorMessageNews
          : errorMessageNews // ignore: cast_nullable_to_non_nullable
              as String,
      localDecisionState: null == localDecisionState
          ? _value.localDecisionState
          : localDecisionState // ignore: cast_nullable_to_non_nullable
              as PageState,
      localDecisions: null == localDecisions
          ? _value.localDecisions
          : localDecisions // ignore: cast_nullable_to_non_nullable
              as List<DecisionModel>,
      fillteredLocalDecisions: null == fillteredLocalDecisions
          ? _value.fillteredLocalDecisions
          : fillteredLocalDecisions // ignore: cast_nullable_to_non_nullable
              as List<DecisionModel>,
      errorMessageLocalDecisions: null == errorMessageLocalDecisions
          ? _value.errorMessageLocalDecisions
          : errorMessageLocalDecisions // ignore: cast_nullable_to_non_nullable
              as String,
      localCouncilTeamState: null == localCouncilTeamState
          ? _value.localCouncilTeamState
          : localCouncilTeamState // ignore: cast_nullable_to_non_nullable
              as PageState,
      localCouncilTeamList: null == localCouncilTeamList
          ? _value.localCouncilTeamList
          : localCouncilTeamList // ignore: cast_nullable_to_non_nullable
              as List<LocalCouncilItemModel>,
      errorMessageLocalCouncilTeam: null == errorMessageLocalCouncilTeam
          ? _value.errorMessageLocalCouncilTeam
          : errorMessageLocalCouncilTeam // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DecisionModelCopyWith<$Res>? get latestDecision {
    if (_value.latestDecision == null) {
      return null;
    }

    return $DecisionModelCopyWith<$Res>(_value.latestDecision!, (value) {
      return _then(_value.copyWith(latestDecision: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LocalAdministrationStateCopyWith<$Res>
    implements $LocalAdministrationStateCopyWith<$Res> {
  factory _$$_LocalAdministrationStateCopyWith(
          _$_LocalAdministrationState value,
          $Res Function(_$_LocalAdministrationState) then) =
      __$$_LocalAdministrationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PageState newsState,
      DecisionModel? latestDecision,
      String errorMessageNews,
      PageState localDecisionState,
      List<DecisionModel> localDecisions,
      List<DecisionModel> fillteredLocalDecisions,
      String errorMessageLocalDecisions,
      PageState localCouncilTeamState,
      List<LocalCouncilItemModel> localCouncilTeamList,
      String errorMessageLocalCouncilTeam});

  @override
  $DecisionModelCopyWith<$Res>? get latestDecision;
}

/// @nodoc
class __$$_LocalAdministrationStateCopyWithImpl<$Res>
    extends _$LocalAdministrationStateCopyWithImpl<$Res,
        _$_LocalAdministrationState>
    implements _$$_LocalAdministrationStateCopyWith<$Res> {
  __$$_LocalAdministrationStateCopyWithImpl(_$_LocalAdministrationState _value,
      $Res Function(_$_LocalAdministrationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newsState = null,
    Object? latestDecision = freezed,
    Object? errorMessageNews = null,
    Object? localDecisionState = null,
    Object? localDecisions = null,
    Object? fillteredLocalDecisions = null,
    Object? errorMessageLocalDecisions = null,
    Object? localCouncilTeamState = null,
    Object? localCouncilTeamList = null,
    Object? errorMessageLocalCouncilTeam = null,
  }) {
    return _then(_$_LocalAdministrationState(
      newsState: null == newsState
          ? _value.newsState
          : newsState // ignore: cast_nullable_to_non_nullable
              as PageState,
      latestDecision: freezed == latestDecision
          ? _value.latestDecision
          : latestDecision // ignore: cast_nullable_to_non_nullable
              as DecisionModel?,
      errorMessageNews: null == errorMessageNews
          ? _value.errorMessageNews
          : errorMessageNews // ignore: cast_nullable_to_non_nullable
              as String,
      localDecisionState: null == localDecisionState
          ? _value.localDecisionState
          : localDecisionState // ignore: cast_nullable_to_non_nullable
              as PageState,
      localDecisions: null == localDecisions
          ? _value._localDecisions
          : localDecisions // ignore: cast_nullable_to_non_nullable
              as List<DecisionModel>,
      fillteredLocalDecisions: null == fillteredLocalDecisions
          ? _value._fillteredLocalDecisions
          : fillteredLocalDecisions // ignore: cast_nullable_to_non_nullable
              as List<DecisionModel>,
      errorMessageLocalDecisions: null == errorMessageLocalDecisions
          ? _value.errorMessageLocalDecisions
          : errorMessageLocalDecisions // ignore: cast_nullable_to_non_nullable
              as String,
      localCouncilTeamState: null == localCouncilTeamState
          ? _value.localCouncilTeamState
          : localCouncilTeamState // ignore: cast_nullable_to_non_nullable
              as PageState,
      localCouncilTeamList: null == localCouncilTeamList
          ? _value._localCouncilTeamList
          : localCouncilTeamList // ignore: cast_nullable_to_non_nullable
              as List<LocalCouncilItemModel>,
      errorMessageLocalCouncilTeam: null == errorMessageLocalCouncilTeam
          ? _value.errorMessageLocalCouncilTeam
          : errorMessageLocalCouncilTeam // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LocalAdministrationState implements _LocalAdministrationState {
  const _$_LocalAdministrationState(
      {this.newsState = PageState.initial,
      this.latestDecision,
      this.errorMessageNews = '',
      this.localDecisionState = PageState.initial,
      final List<DecisionModel> localDecisions = const [],
      final List<DecisionModel> fillteredLocalDecisions = const [],
      this.errorMessageLocalDecisions = '',
      this.localCouncilTeamState = PageState.initial,
      final List<LocalCouncilItemModel> localCouncilTeamList = const [],
      this.errorMessageLocalCouncilTeam = ''})
      : _localDecisions = localDecisions,
        _fillteredLocalDecisions = fillteredLocalDecisions,
        _localCouncilTeamList = localCouncilTeamList;

//Latest NEWS
  @override
  @JsonKey()
  final PageState newsState;
  @override
  final DecisionModel? latestDecision;
  @override
  @JsonKey()
  final String errorMessageNews;
//Local decisions
  @override
  @JsonKey()
  final PageState localDecisionState;
  final List<DecisionModel> _localDecisions;
  @override
  @JsonKey()
  List<DecisionModel> get localDecisions {
    if (_localDecisions is EqualUnmodifiableListView) return _localDecisions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_localDecisions);
  }

  final List<DecisionModel> _fillteredLocalDecisions;
  @override
  @JsonKey()
  List<DecisionModel> get fillteredLocalDecisions {
    if (_fillteredLocalDecisions is EqualUnmodifiableListView)
      return _fillteredLocalDecisions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fillteredLocalDecisions);
  }

  @override
  @JsonKey()
  final String errorMessageLocalDecisions;
// Local council team
  @override
  @JsonKey()
  final PageState localCouncilTeamState;
  final List<LocalCouncilItemModel> _localCouncilTeamList;
  @override
  @JsonKey()
  List<LocalCouncilItemModel> get localCouncilTeamList {
    if (_localCouncilTeamList is EqualUnmodifiableListView)
      return _localCouncilTeamList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_localCouncilTeamList);
  }

  @override
  @JsonKey()
  final String errorMessageLocalCouncilTeam;

  @override
  String toString() {
    return 'LocalAdministrationState(newsState: $newsState, latestDecision: $latestDecision, errorMessageNews: $errorMessageNews, localDecisionState: $localDecisionState, localDecisions: $localDecisions, fillteredLocalDecisions: $fillteredLocalDecisions, errorMessageLocalDecisions: $errorMessageLocalDecisions, localCouncilTeamState: $localCouncilTeamState, localCouncilTeamList: $localCouncilTeamList, errorMessageLocalCouncilTeam: $errorMessageLocalCouncilTeam)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocalAdministrationState &&
            (identical(other.newsState, newsState) ||
                other.newsState == newsState) &&
            (identical(other.latestDecision, latestDecision) ||
                other.latestDecision == latestDecision) &&
            (identical(other.errorMessageNews, errorMessageNews) ||
                other.errorMessageNews == errorMessageNews) &&
            (identical(other.localDecisionState, localDecisionState) ||
                other.localDecisionState == localDecisionState) &&
            const DeepCollectionEquality()
                .equals(other._localDecisions, _localDecisions) &&
            const DeepCollectionEquality().equals(
                other._fillteredLocalDecisions, _fillteredLocalDecisions) &&
            (identical(other.errorMessageLocalDecisions,
                    errorMessageLocalDecisions) ||
                other.errorMessageLocalDecisions ==
                    errorMessageLocalDecisions) &&
            (identical(other.localCouncilTeamState, localCouncilTeamState) ||
                other.localCouncilTeamState == localCouncilTeamState) &&
            const DeepCollectionEquality()
                .equals(other._localCouncilTeamList, _localCouncilTeamList) &&
            (identical(other.errorMessageLocalCouncilTeam,
                    errorMessageLocalCouncilTeam) ||
                other.errorMessageLocalCouncilTeam ==
                    errorMessageLocalCouncilTeam));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      newsState,
      latestDecision,
      errorMessageNews,
      localDecisionState,
      const DeepCollectionEquality().hash(_localDecisions),
      const DeepCollectionEquality().hash(_fillteredLocalDecisions),
      errorMessageLocalDecisions,
      localCouncilTeamState,
      const DeepCollectionEquality().hash(_localCouncilTeamList),
      errorMessageLocalCouncilTeam);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocalAdministrationStateCopyWith<_$_LocalAdministrationState>
      get copyWith => __$$_LocalAdministrationStateCopyWithImpl<
          _$_LocalAdministrationState>(this, _$identity);
}

abstract class _LocalAdministrationState implements LocalAdministrationState {
  const factory _LocalAdministrationState(
      {final PageState newsState,
      final DecisionModel? latestDecision,
      final String errorMessageNews,
      final PageState localDecisionState,
      final List<DecisionModel> localDecisions,
      final List<DecisionModel> fillteredLocalDecisions,
      final String errorMessageLocalDecisions,
      final PageState localCouncilTeamState,
      final List<LocalCouncilItemModel> localCouncilTeamList,
      final String errorMessageLocalCouncilTeam}) = _$_LocalAdministrationState;

  @override //Latest NEWS
  PageState get newsState;
  @override
  DecisionModel? get latestDecision;
  @override
  String get errorMessageNews;
  @override //Local decisions
  PageState get localDecisionState;
  @override
  List<DecisionModel> get localDecisions;
  @override
  List<DecisionModel> get fillteredLocalDecisions;
  @override
  String get errorMessageLocalDecisions;
  @override // Local council team
  PageState get localCouncilTeamState;
  @override
  List<LocalCouncilItemModel> get localCouncilTeamList;
  @override
  String get errorMessageLocalCouncilTeam;
  @override
  @JsonKey(ignore: true)
  _$$_LocalAdministrationStateCopyWith<_$_LocalAdministrationState>
      get copyWith => throw _privateConstructorUsedError;
}
