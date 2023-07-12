// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_events_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewEventsModel _$NewEventsModelFromJson(Map<String, dynamic> json) {
  return _NewEventsModel.fromJson(json);
}

/// @nodoc
mixin _$NewEventsModel {
  @JsonKey(name: 'events', defaultValue: [])
  List<EventsItemModel> get list => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewEventsModelCopyWith<NewEventsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewEventsModelCopyWith<$Res> {
  factory $NewEventsModelCopyWith(
          NewEventsModel value, $Res Function(NewEventsModel) then) =
      _$NewEventsModelCopyWithImpl<$Res, NewEventsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'events', defaultValue: []) List<EventsItemModel> list});
}

/// @nodoc
class _$NewEventsModelCopyWithImpl<$Res, $Val extends NewEventsModel>
    implements $NewEventsModelCopyWith<$Res> {
  _$NewEventsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<EventsItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewEventsModelCopyWith<$Res>
    implements $NewEventsModelCopyWith<$Res> {
  factory _$$_NewEventsModelCopyWith(
          _$_NewEventsModel value, $Res Function(_$_NewEventsModel) then) =
      __$$_NewEventsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'events', defaultValue: []) List<EventsItemModel> list});
}

/// @nodoc
class __$$_NewEventsModelCopyWithImpl<$Res>
    extends _$NewEventsModelCopyWithImpl<$Res, _$_NewEventsModel>
    implements _$$_NewEventsModelCopyWith<$Res> {
  __$$_NewEventsModelCopyWithImpl(
      _$_NewEventsModel _value, $Res Function(_$_NewEventsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_$_NewEventsModel(
      null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<EventsItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewEventsModel implements _NewEventsModel {
  const _$_NewEventsModel(
      @JsonKey(name: 'events', defaultValue: [])
          final List<EventsItemModel> list)
      : _list = list;

  factory _$_NewEventsModel.fromJson(Map<String, dynamic> json) =>
      _$$_NewEventsModelFromJson(json);

  final List<EventsItemModel> _list;
  @override
  @JsonKey(name: 'events', defaultValue: [])
  List<EventsItemModel> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'NewEventsModel(list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewEventsModel &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewEventsModelCopyWith<_$_NewEventsModel> get copyWith =>
      __$$_NewEventsModelCopyWithImpl<_$_NewEventsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewEventsModelToJson(
      this,
    );
  }
}

abstract class _NewEventsModel implements NewEventsModel {
  const factory _NewEventsModel(
      @JsonKey(name: 'events', defaultValue: [])
          final List<EventsItemModel> list) = _$_NewEventsModel;

  factory _NewEventsModel.fromJson(Map<String, dynamic> json) =
      _$_NewEventsModel.fromJson;

  @override
  @JsonKey(name: 'events', defaultValue: [])
  List<EventsItemModel> get list;
  @override
  @JsonKey(ignore: true)
  _$$_NewEventsModelCopyWith<_$_NewEventsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
