// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'public_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PublicModel _$PublicModelFromJson(Map<String, dynamic> json) {
  return _PublicModel.fromJson(json);
}

/// @nodoc
mixin _$PublicModel {
  @JsonKey(name: 'public', defaultValue: [])
  List<PublicItemModel> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PublicModelCopyWith<PublicModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicModelCopyWith<$Res> {
  factory $PublicModelCopyWith(
          PublicModel value, $Res Function(PublicModel) then) =
      _$PublicModelCopyWithImpl<$Res, PublicModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'public', defaultValue: []) List<PublicItemModel> items});
}

/// @nodoc
class _$PublicModelCopyWithImpl<$Res, $Val extends PublicModel>
    implements $PublicModelCopyWith<$Res> {
  _$PublicModelCopyWithImpl(this._value, this._then);

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
              as List<PublicItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PublicModelCopyWith<$Res>
    implements $PublicModelCopyWith<$Res> {
  factory _$$_PublicModelCopyWith(
          _$_PublicModel value, $Res Function(_$_PublicModel) then) =
      __$$_PublicModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'public', defaultValue: []) List<PublicItemModel> items});
}

/// @nodoc
class __$$_PublicModelCopyWithImpl<$Res>
    extends _$PublicModelCopyWithImpl<$Res, _$_PublicModel>
    implements _$$_PublicModelCopyWith<$Res> {
  __$$_PublicModelCopyWithImpl(
      _$_PublicModel _value, $Res Function(_$_PublicModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$_PublicModel(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PublicItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PublicModel implements _PublicModel {
  const _$_PublicModel(
      {@JsonKey(name: 'public', defaultValue: [])
          required final List<PublicItemModel> items})
      : _items = items;

  factory _$_PublicModel.fromJson(Map<String, dynamic> json) =>
      _$$_PublicModelFromJson(json);

  final List<PublicItemModel> _items;
  @override
  @JsonKey(name: 'public', defaultValue: [])
  List<PublicItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'PublicModel(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PublicModel &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PublicModelCopyWith<_$_PublicModel> get copyWith =>
      __$$_PublicModelCopyWithImpl<_$_PublicModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PublicModelToJson(
      this,
    );
  }
}

abstract class _PublicModel implements PublicModel {
  const factory _PublicModel(
      {@JsonKey(name: 'public', defaultValue: [])
          required final List<PublicItemModel> items}) = _$_PublicModel;

  factory _PublicModel.fromJson(Map<String, dynamic> json) =
      _$_PublicModel.fromJson;

  @override
  @JsonKey(name: 'public', defaultValue: [])
  List<PublicItemModel> get items;
  @override
  @JsonKey(ignore: true)
  _$$_PublicModelCopyWith<_$_PublicModel> get copyWith =>
      throw _privateConstructorUsedError;
}

PublicItemModel _$PublicItemModelFromJson(Map<String, dynamic> json) {
  return _PublicItemModel.fromJson(json);
}

/// @nodoc
mixin _$PublicItemModel {
  @JsonKey(name: 'email', defaultValue: [])
  List<String> get emails => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone', defaultValue: [])
  List<String> get phones => throw _privateConstructorUsedError;
  @JsonKey(name: 'title', defaultValue: '')
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PublicItemModelCopyWith<PublicItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicItemModelCopyWith<$Res> {
  factory $PublicItemModelCopyWith(
          PublicItemModel value, $Res Function(PublicItemModel) then) =
      _$PublicItemModelCopyWithImpl<$Res, PublicItemModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'email', defaultValue: []) List<String> emails,
      @JsonKey(name: 'phone', defaultValue: []) List<String> phones,
      @JsonKey(name: 'title', defaultValue: '') String title});
}

/// @nodoc
class _$PublicItemModelCopyWithImpl<$Res, $Val extends PublicItemModel>
    implements $PublicItemModelCopyWith<$Res> {
  _$PublicItemModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_PublicItemModelCopyWith<$Res>
    implements $PublicItemModelCopyWith<$Res> {
  factory _$$_PublicItemModelCopyWith(
          _$_PublicItemModel value, $Res Function(_$_PublicItemModel) then) =
      __$$_PublicItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'email', defaultValue: []) List<String> emails,
      @JsonKey(name: 'phone', defaultValue: []) List<String> phones,
      @JsonKey(name: 'title', defaultValue: '') String title});
}

/// @nodoc
class __$$_PublicItemModelCopyWithImpl<$Res>
    extends _$PublicItemModelCopyWithImpl<$Res, _$_PublicItemModel>
    implements _$$_PublicItemModelCopyWith<$Res> {
  __$$_PublicItemModelCopyWithImpl(
      _$_PublicItemModel _value, $Res Function(_$_PublicItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emails = null,
    Object? phones = null,
    Object? title = null,
  }) {
    return _then(_$_PublicItemModel(
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
class _$_PublicItemModel implements _PublicItemModel {
  const _$_PublicItemModel(
      {@JsonKey(name: 'email', defaultValue: [])
          required final List<String> emails,
      @JsonKey(name: 'phone', defaultValue: [])
          required final List<String> phones,
      @JsonKey(name: 'title', defaultValue: '')
          required this.title})
      : _emails = emails,
        _phones = phones;

  factory _$_PublicItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_PublicItemModelFromJson(json);

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
    return 'PublicItemModel(emails: $emails, phones: $phones, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PublicItemModel &&
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
  _$$_PublicItemModelCopyWith<_$_PublicItemModel> get copyWith =>
      __$$_PublicItemModelCopyWithImpl<_$_PublicItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PublicItemModelToJson(
      this,
    );
  }
}

abstract class _PublicItemModel implements PublicItemModel {
  const factory _PublicItemModel(
      {@JsonKey(name: 'email', defaultValue: [])
          required final List<String> emails,
      @JsonKey(name: 'phone', defaultValue: [])
          required final List<String> phones,
      @JsonKey(name: 'title', defaultValue: '')
          required final String title}) = _$_PublicItemModel;

  factory _PublicItemModel.fromJson(Map<String, dynamic> json) =
      _$_PublicItemModel.fromJson;

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
  _$$_PublicItemModelCopyWith<_$_PublicItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
