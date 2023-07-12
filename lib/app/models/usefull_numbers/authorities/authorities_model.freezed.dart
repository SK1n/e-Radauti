// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authorities_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthoritiesModel _$AuthoritiesModelFromJson(Map<String, dynamic> json) {
  return _AuthoritiesModel.fromJson(json);
}

/// @nodoc
mixin _$AuthoritiesModel {
  @JsonKey(name: 'authorities', defaultValue: [])
  List<AuthoritiesItemModel> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthoritiesModelCopyWith<AuthoritiesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthoritiesModelCopyWith<$Res> {
  factory $AuthoritiesModelCopyWith(
          AuthoritiesModel value, $Res Function(AuthoritiesModel) then) =
      _$AuthoritiesModelCopyWithImpl<$Res, AuthoritiesModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'authorities', defaultValue: [])
          List<AuthoritiesItemModel> items});
}

/// @nodoc
class _$AuthoritiesModelCopyWithImpl<$Res, $Val extends AuthoritiesModel>
    implements $AuthoritiesModelCopyWith<$Res> {
  _$AuthoritiesModelCopyWithImpl(this._value, this._then);

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
              as List<AuthoritiesItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthoritiesModelCopyWith<$Res>
    implements $AuthoritiesModelCopyWith<$Res> {
  factory _$$_AuthoritiesModelCopyWith(
          _$_AuthoritiesModel value, $Res Function(_$_AuthoritiesModel) then) =
      __$$_AuthoritiesModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'authorities', defaultValue: [])
          List<AuthoritiesItemModel> items});
}

/// @nodoc
class __$$_AuthoritiesModelCopyWithImpl<$Res>
    extends _$AuthoritiesModelCopyWithImpl<$Res, _$_AuthoritiesModel>
    implements _$$_AuthoritiesModelCopyWith<$Res> {
  __$$_AuthoritiesModelCopyWithImpl(
      _$_AuthoritiesModel _value, $Res Function(_$_AuthoritiesModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$_AuthoritiesModel(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<AuthoritiesItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthoritiesModel implements _AuthoritiesModel {
  const _$_AuthoritiesModel(
      {@JsonKey(name: 'authorities', defaultValue: [])
          required final List<AuthoritiesItemModel> items})
      : _items = items;

  factory _$_AuthoritiesModel.fromJson(Map<String, dynamic> json) =>
      _$$_AuthoritiesModelFromJson(json);

  final List<AuthoritiesItemModel> _items;
  @override
  @JsonKey(name: 'authorities', defaultValue: [])
  List<AuthoritiesItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'AuthoritiesModel(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthoritiesModel &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthoritiesModelCopyWith<_$_AuthoritiesModel> get copyWith =>
      __$$_AuthoritiesModelCopyWithImpl<_$_AuthoritiesModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthoritiesModelToJson(
      this,
    );
  }
}

abstract class _AuthoritiesModel implements AuthoritiesModel {
  const factory _AuthoritiesModel(
          {@JsonKey(name: 'authorities', defaultValue: [])
              required final List<AuthoritiesItemModel> items}) =
      _$_AuthoritiesModel;

  factory _AuthoritiesModel.fromJson(Map<String, dynamic> json) =
      _$_AuthoritiesModel.fromJson;

  @override
  @JsonKey(name: 'authorities', defaultValue: [])
  List<AuthoritiesItemModel> get items;
  @override
  @JsonKey(ignore: true)
  _$$_AuthoritiesModelCopyWith<_$_AuthoritiesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

AuthoritiesItemModel _$AuthoritiesItemModelFromJson(Map<String, dynamic> json) {
  return _AuthoritiesItemModel.fromJson(json);
}

/// @nodoc
mixin _$AuthoritiesItemModel {
  @JsonKey(name: 'email', defaultValue: [])
  List<String> get emails => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone', defaultValue: [])
  List<String> get phones => throw _privateConstructorUsedError;
  @JsonKey(name: 'title', defaultValue: '')
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthoritiesItemModelCopyWith<AuthoritiesItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthoritiesItemModelCopyWith<$Res> {
  factory $AuthoritiesItemModelCopyWith(AuthoritiesItemModel value,
          $Res Function(AuthoritiesItemModel) then) =
      _$AuthoritiesItemModelCopyWithImpl<$Res, AuthoritiesItemModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'email', defaultValue: []) List<String> emails,
      @JsonKey(name: 'phone', defaultValue: []) List<String> phones,
      @JsonKey(name: 'title', defaultValue: '') String title});
}

/// @nodoc
class _$AuthoritiesItemModelCopyWithImpl<$Res,
        $Val extends AuthoritiesItemModel>
    implements $AuthoritiesItemModelCopyWith<$Res> {
  _$AuthoritiesItemModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_AuthoritiesItemModelCopyWith<$Res>
    implements $AuthoritiesItemModelCopyWith<$Res> {
  factory _$$_AuthoritiesItemModelCopyWith(_$_AuthoritiesItemModel value,
          $Res Function(_$_AuthoritiesItemModel) then) =
      __$$_AuthoritiesItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'email', defaultValue: []) List<String> emails,
      @JsonKey(name: 'phone', defaultValue: []) List<String> phones,
      @JsonKey(name: 'title', defaultValue: '') String title});
}

/// @nodoc
class __$$_AuthoritiesItemModelCopyWithImpl<$Res>
    extends _$AuthoritiesItemModelCopyWithImpl<$Res, _$_AuthoritiesItemModel>
    implements _$$_AuthoritiesItemModelCopyWith<$Res> {
  __$$_AuthoritiesItemModelCopyWithImpl(_$_AuthoritiesItemModel _value,
      $Res Function(_$_AuthoritiesItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emails = null,
    Object? phones = null,
    Object? title = null,
  }) {
    return _then(_$_AuthoritiesItemModel(
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
class _$_AuthoritiesItemModel implements _AuthoritiesItemModel {
  const _$_AuthoritiesItemModel(
      {@JsonKey(name: 'email', defaultValue: [])
          required final List<String> emails,
      @JsonKey(name: 'phone', defaultValue: [])
          required final List<String> phones,
      @JsonKey(name: 'title', defaultValue: '')
          required this.title})
      : _emails = emails,
        _phones = phones;

  factory _$_AuthoritiesItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_AuthoritiesItemModelFromJson(json);

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
    return 'AuthoritiesItemModel(emails: $emails, phones: $phones, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthoritiesItemModel &&
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
  _$$_AuthoritiesItemModelCopyWith<_$_AuthoritiesItemModel> get copyWith =>
      __$$_AuthoritiesItemModelCopyWithImpl<_$_AuthoritiesItemModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthoritiesItemModelToJson(
      this,
    );
  }
}

abstract class _AuthoritiesItemModel implements AuthoritiesItemModel {
  const factory _AuthoritiesItemModel(
      {@JsonKey(name: 'email', defaultValue: [])
          required final List<String> emails,
      @JsonKey(name: 'phone', defaultValue: [])
          required final List<String> phones,
      @JsonKey(name: 'title', defaultValue: '')
          required final String title}) = _$_AuthoritiesItemModel;

  factory _AuthoritiesItemModel.fromJson(Map<String, dynamic> json) =
      _$_AuthoritiesItemModel.fromJson;

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
  _$$_AuthoritiesItemModelCopyWith<_$_AuthoritiesItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
