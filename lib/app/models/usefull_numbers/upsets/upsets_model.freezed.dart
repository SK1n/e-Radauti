// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upsets_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpsetsModel _$UpsetsModelFromJson(Map<String, dynamic> json) {
  return _UpsetsModel.fromJson(json);
}

/// @nodoc
mixin _$UpsetsModel {
  @JsonKey(name: 'upsets', defaultValue: [])
  List<UpsetsItemModel> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpsetsModelCopyWith<UpsetsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpsetsModelCopyWith<$Res> {
  factory $UpsetsModelCopyWith(
          UpsetsModel value, $Res Function(UpsetsModel) then) =
      _$UpsetsModelCopyWithImpl<$Res, UpsetsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'upsets', defaultValue: []) List<UpsetsItemModel> items});
}

/// @nodoc
class _$UpsetsModelCopyWithImpl<$Res, $Val extends UpsetsModel>
    implements $UpsetsModelCopyWith<$Res> {
  _$UpsetsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<UpsetsItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpsetsModelCopyWith<$Res>
    implements $UpsetsModelCopyWith<$Res> {
  factory _$$_UpsetsModelCopyWith(
          _$_UpsetsModel value, $Res Function(_$_UpsetsModel) then) =
      __$$_UpsetsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'upsets', defaultValue: []) List<UpsetsItemModel> items});
}

/// @nodoc
class __$$_UpsetsModelCopyWithImpl<$Res>
    extends _$UpsetsModelCopyWithImpl<$Res, _$_UpsetsModel>
    implements _$$_UpsetsModelCopyWith<$Res> {
  __$$_UpsetsModelCopyWithImpl(
      _$_UpsetsModel _value, $Res Function(_$_UpsetsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$_UpsetsModel(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<UpsetsItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpsetsModel implements _UpsetsModel {
  const _$_UpsetsModel(
      {@JsonKey(name: 'upsets', defaultValue: [])
          required final List<UpsetsItemModel> items})
      : _items = items;

  factory _$_UpsetsModel.fromJson(Map<String, dynamic> json) =>
      _$$_UpsetsModelFromJson(json);

  final List<UpsetsItemModel> _items;
  @override
  @JsonKey(name: 'upsets', defaultValue: [])
  List<UpsetsItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'UpsetsModel(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpsetsModel &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpsetsModelCopyWith<_$_UpsetsModel> get copyWith =>
      __$$_UpsetsModelCopyWithImpl<_$_UpsetsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpsetsModelToJson(
      this,
    );
  }
}

abstract class _UpsetsModel implements UpsetsModel {
  const factory _UpsetsModel(
      {@JsonKey(name: 'upsets', defaultValue: [])
          required final List<UpsetsItemModel> items}) = _$_UpsetsModel;

  factory _UpsetsModel.fromJson(Map<String, dynamic> json) =
      _$_UpsetsModel.fromJson;

  @override
  @JsonKey(name: 'upsets', defaultValue: [])
  List<UpsetsItemModel> get items;
  @override
  @JsonKey(ignore: true)
  _$$_UpsetsModelCopyWith<_$_UpsetsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

UpsetsItemModel _$UpsetsItemModelFromJson(Map<String, dynamic> json) {
  return _UpsetsItemModel.fromJson(json);
}

/// @nodoc
mixin _$UpsetsItemModel {
  @JsonKey(name: 'email', defaultValue: [])
  List<String> get emails => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone', defaultValue: [])
  List<String> get phones => throw _privateConstructorUsedError;
  @JsonKey(name: 'title', defaultValue: '')
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpsetsItemModelCopyWith<UpsetsItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpsetsItemModelCopyWith<$Res> {
  factory $UpsetsItemModelCopyWith(
          UpsetsItemModel value, $Res Function(UpsetsItemModel) then) =
      _$UpsetsItemModelCopyWithImpl<$Res, UpsetsItemModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'email', defaultValue: []) List<String> emails,
      @JsonKey(name: 'phone', defaultValue: []) List<String> phones,
      @JsonKey(name: 'title', defaultValue: '') String title});
}

/// @nodoc
class _$UpsetsItemModelCopyWithImpl<$Res, $Val extends UpsetsItemModel>
    implements $UpsetsItemModelCopyWith<$Res> {
  _$UpsetsItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emails = null,
    Object? phones = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      emails: null == emails
          ? _value.emails
          : emails // ignore: cast_nullable_to_non_nullable
              as List<String>,
      phones: null == phones
          ? _value.phones
          : phones // ignore: cast_nullable_to_non_nullable
              as List<String>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpsetsItemModelCopyWith<$Res>
    implements $UpsetsItemModelCopyWith<$Res> {
  factory _$$_UpsetsItemModelCopyWith(
          _$_UpsetsItemModel value, $Res Function(_$_UpsetsItemModel) then) =
      __$$_UpsetsItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'email', defaultValue: []) List<String> emails,
      @JsonKey(name: 'phone', defaultValue: []) List<String> phones,
      @JsonKey(name: 'title', defaultValue: '') String title});
}

/// @nodoc
class __$$_UpsetsItemModelCopyWithImpl<$Res>
    extends _$UpsetsItemModelCopyWithImpl<$Res, _$_UpsetsItemModel>
    implements _$$_UpsetsItemModelCopyWith<$Res> {
  __$$_UpsetsItemModelCopyWithImpl(
      _$_UpsetsItemModel _value, $Res Function(_$_UpsetsItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emails = null,
    Object? phones = null,
    Object? title = null,
  }) {
    return _then(_$_UpsetsItemModel(
      emails: null == emails
          ? _value._emails
          : emails // ignore: cast_nullable_to_non_nullable
              as List<String>,
      phones: null == phones
          ? _value._phones
          : phones // ignore: cast_nullable_to_non_nullable
              as List<String>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpsetsItemModel implements _UpsetsItemModel {
  const _$_UpsetsItemModel(
      {@JsonKey(name: 'email', defaultValue: [])
          required final List<String> emails,
      @JsonKey(name: 'phone', defaultValue: [])
          required final List<String> phones,
      @JsonKey(name: 'title', defaultValue: '')
          required this.title})
      : _emails = emails,
        _phones = phones;

  factory _$_UpsetsItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_UpsetsItemModelFromJson(json);

  final List<String> _emails;
  @override
  @JsonKey(name: 'email', defaultValue: [])
  List<String> get emails {
    if (_emails is EqualUnmodifiableListView) return _emails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_emails);
  }

  final List<String> _phones;
  @override
  @JsonKey(name: 'phone', defaultValue: [])
  List<String> get phones {
    if (_phones is EqualUnmodifiableListView) return _phones;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_phones);
  }

  @override
  @JsonKey(name: 'title', defaultValue: '')
  final String title;

  @override
  String toString() {
    return 'UpsetsItemModel(emails: $emails, phones: $phones, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpsetsItemModel &&
            const DeepCollectionEquality().equals(other._emails, _emails) &&
            const DeepCollectionEquality().equals(other._phones, _phones) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_emails),
      const DeepCollectionEquality().hash(_phones),
      title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpsetsItemModelCopyWith<_$_UpsetsItemModel> get copyWith =>
      __$$_UpsetsItemModelCopyWithImpl<_$_UpsetsItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpsetsItemModelToJson(
      this,
    );
  }
}

abstract class _UpsetsItemModel implements UpsetsItemModel {
  const factory _UpsetsItemModel(
      {@JsonKey(name: 'email', defaultValue: [])
          required final List<String> emails,
      @JsonKey(name: 'phone', defaultValue: [])
          required final List<String> phones,
      @JsonKey(name: 'title', defaultValue: '')
          required final String title}) = _$_UpsetsItemModel;

  factory _UpsetsItemModel.fromJson(Map<String, dynamic> json) =
      _$_UpsetsItemModel.fromJson;

  @override
  @JsonKey(name: 'email', defaultValue: [])
  List<String> get emails;
  @override
  @JsonKey(name: 'phone', defaultValue: [])
  List<String> get phones;
  @override
  @JsonKey(name: 'title', defaultValue: '')
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_UpsetsItemModelCopyWith<_$_UpsetsItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
