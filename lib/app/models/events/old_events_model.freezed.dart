// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'old_events_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OldEventsModel _$OldEventsModelFromJson(Map<String, dynamic> json) {
  return _OldEventsModel.fromJson(json);
}

/// @nodoc
mixin _$OldEventsModel {
  @JsonKey(name: 'oldEvents')
  List<EventsItemModel> get list => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OldEventsModelCopyWith<OldEventsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OldEventsModelCopyWith<$Res> {
  factory $OldEventsModelCopyWith(
          OldEventsModel value, $Res Function(OldEventsModel) then) =
      _$OldEventsModelCopyWithImpl<$Res, OldEventsModel>;
  @useResult
  $Res call({@JsonKey(name: 'oldEvents') List<EventsItemModel> list});
}

/// @nodoc
class _$OldEventsModelCopyWithImpl<$Res, $Val extends OldEventsModel>
    implements $OldEventsModelCopyWith<$Res> {
  _$OldEventsModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_OldEventsModelCopyWith<$Res>
    implements $OldEventsModelCopyWith<$Res> {
  factory _$$_OldEventsModelCopyWith(
          _$_OldEventsModel value, $Res Function(_$_OldEventsModel) then) =
      __$$_OldEventsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'oldEvents') List<EventsItemModel> list});
}

/// @nodoc
class __$$_OldEventsModelCopyWithImpl<$Res>
    extends _$OldEventsModelCopyWithImpl<$Res, _$_OldEventsModel>
    implements _$$_OldEventsModelCopyWith<$Res> {
  __$$_OldEventsModelCopyWithImpl(
      _$_OldEventsModel _value, $Res Function(_$_OldEventsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_$_OldEventsModel(
      null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<EventsItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OldEventsModel implements _OldEventsModel {
  const _$_OldEventsModel(
      @JsonKey(name: 'oldEvents') final List<EventsItemModel> list)
      : _list = list;

  factory _$_OldEventsModel.fromJson(Map<String, dynamic> json) =>
      _$$_OldEventsModelFromJson(json);

  final List<EventsItemModel> _list;
  @override
  @JsonKey(name: 'oldEvents')
  List<EventsItemModel> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'OldEventsModel(list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OldEventsModel &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OldEventsModelCopyWith<_$_OldEventsModel> get copyWith =>
      __$$_OldEventsModelCopyWithImpl<_$_OldEventsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OldEventsModelToJson(
      this,
    );
  }
}

abstract class _OldEventsModel implements OldEventsModel {
  const factory _OldEventsModel(
          @JsonKey(name: 'oldEvents') final List<EventsItemModel> list) =
      _$_OldEventsModel;

  factory _OldEventsModel.fromJson(Map<String, dynamic> json) =
      _$_OldEventsModel.fromJson;

  @override
  @JsonKey(name: 'oldEvents')
  List<EventsItemModel> get list;
  @override
  @JsonKey(ignore: true)
  _$$_OldEventsModelCopyWith<_$_OldEventsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
