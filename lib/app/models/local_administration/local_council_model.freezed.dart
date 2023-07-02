// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_council_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocalCouncilModel _$LocalCouncilModelFromJson(Map<String, dynamic> json) {
  return _LocalCouncilModel.fromJson(json);
}

/// @nodoc
mixin _$LocalCouncilModel {
  @JsonKey(name: 'localcouncil', defaultValue: [])
  List<LocalCouncilItemModel> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalCouncilModelCopyWith<LocalCouncilModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalCouncilModelCopyWith<$Res> {
  factory $LocalCouncilModelCopyWith(
          LocalCouncilModel value, $Res Function(LocalCouncilModel) then) =
      _$LocalCouncilModelCopyWithImpl<$Res, LocalCouncilModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'localcouncil', defaultValue: [])
          List<LocalCouncilItemModel> items});
}

/// @nodoc
class _$LocalCouncilModelCopyWithImpl<$Res, $Val extends LocalCouncilModel>
    implements $LocalCouncilModelCopyWith<$Res> {
  _$LocalCouncilModelCopyWithImpl(this._value, this._then);

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
              as List<LocalCouncilItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocalCouncilModelCopyWith<$Res>
    implements $LocalCouncilModelCopyWith<$Res> {
  factory _$$_LocalCouncilModelCopyWith(_$_LocalCouncilModel value,
          $Res Function(_$_LocalCouncilModel) then) =
      __$$_LocalCouncilModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'localcouncil', defaultValue: [])
          List<LocalCouncilItemModel> items});
}

/// @nodoc
class __$$_LocalCouncilModelCopyWithImpl<$Res>
    extends _$LocalCouncilModelCopyWithImpl<$Res, _$_LocalCouncilModel>
    implements _$$_LocalCouncilModelCopyWith<$Res> {
  __$$_LocalCouncilModelCopyWithImpl(
      _$_LocalCouncilModel _value, $Res Function(_$_LocalCouncilModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$_LocalCouncilModel(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<LocalCouncilItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LocalCouncilModel implements _LocalCouncilModel {
  const _$_LocalCouncilModel(
      {@JsonKey(name: 'localcouncil', defaultValue: [])
          required final List<LocalCouncilItemModel> items})
      : _items = items;

  factory _$_LocalCouncilModel.fromJson(Map<String, dynamic> json) =>
      _$$_LocalCouncilModelFromJson(json);

  final List<LocalCouncilItemModel> _items;
  @override
  @JsonKey(name: 'localcouncil', defaultValue: [])
  List<LocalCouncilItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'LocalCouncilModel(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocalCouncilModel &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocalCouncilModelCopyWith<_$_LocalCouncilModel> get copyWith =>
      __$$_LocalCouncilModelCopyWithImpl<_$_LocalCouncilModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocalCouncilModelToJson(
      this,
    );
  }
}

abstract class _LocalCouncilModel implements LocalCouncilModel {
  const factory _LocalCouncilModel(
          {@JsonKey(name: 'localcouncil', defaultValue: [])
              required final List<LocalCouncilItemModel> items}) =
      _$_LocalCouncilModel;

  factory _LocalCouncilModel.fromJson(Map<String, dynamic> json) =
      _$_LocalCouncilModel.fromJson;

  @override
  @JsonKey(name: 'localcouncil', defaultValue: [])
  List<LocalCouncilItemModel> get items;
  @override
  @JsonKey(ignore: true)
  _$$_LocalCouncilModelCopyWith<_$_LocalCouncilModel> get copyWith =>
      throw _privateConstructorUsedError;
}

LocalCouncilItemModel _$LocalCouncilItemModelFromJson(
    Map<String, dynamic> json) {
  return _LocalCouncilItemModel.fromJson(json);
}

/// @nodoc
mixin _$LocalCouncilItemModel {
  @JsonKey(name: 'name', defaultValue: '')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'url', defaultValue: '')
  String get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'party', defaultValue: '')
  String get party => throw _privateConstructorUsedError;
  @JsonKey(name: 'email', defaultValue: '')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number', defaultValue: '')
  String get tel => throw _privateConstructorUsedError;
  @JsonKey(name: 'function', defaultValue: '')
  String get function => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalCouncilItemModelCopyWith<LocalCouncilItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalCouncilItemModelCopyWith<$Res> {
  factory $LocalCouncilItemModelCopyWith(LocalCouncilItemModel value,
          $Res Function(LocalCouncilItemModel) then) =
      _$LocalCouncilItemModelCopyWithImpl<$Res, LocalCouncilItemModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(name: 'url', defaultValue: '') String imageUrl,
      @JsonKey(name: 'party', defaultValue: '') String party,
      @JsonKey(name: 'email', defaultValue: '') String email,
      @JsonKey(name: 'phone_number', defaultValue: '') String tel,
      @JsonKey(name: 'function', defaultValue: '') String function});
}

/// @nodoc
class _$LocalCouncilItemModelCopyWithImpl<$Res,
        $Val extends LocalCouncilItemModel>
    implements $LocalCouncilItemModelCopyWith<$Res> {
  _$LocalCouncilItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? imageUrl = null,
    Object? party = null,
    Object? email = null,
    Object? tel = null,
    Object? function = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      party: null == party
          ? _value.party
          : party // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      tel: null == tel
          ? _value.tel
          : tel // ignore: cast_nullable_to_non_nullable
              as String,
      function: null == function
          ? _value.function
          : function // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocalCouncilItemModelCopyWith<$Res>
    implements $LocalCouncilItemModelCopyWith<$Res> {
  factory _$$_LocalCouncilItemModelCopyWith(_$_LocalCouncilItemModel value,
          $Res Function(_$_LocalCouncilItemModel) then) =
      __$$_LocalCouncilItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(name: 'url', defaultValue: '') String imageUrl,
      @JsonKey(name: 'party', defaultValue: '') String party,
      @JsonKey(name: 'email', defaultValue: '') String email,
      @JsonKey(name: 'phone_number', defaultValue: '') String tel,
      @JsonKey(name: 'function', defaultValue: '') String function});
}

/// @nodoc
class __$$_LocalCouncilItemModelCopyWithImpl<$Res>
    extends _$LocalCouncilItemModelCopyWithImpl<$Res, _$_LocalCouncilItemModel>
    implements _$$_LocalCouncilItemModelCopyWith<$Res> {
  __$$_LocalCouncilItemModelCopyWithImpl(_$_LocalCouncilItemModel _value,
      $Res Function(_$_LocalCouncilItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? imageUrl = null,
    Object? party = null,
    Object? email = null,
    Object? tel = null,
    Object? function = null,
  }) {
    return _then(_$_LocalCouncilItemModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      party: null == party
          ? _value.party
          : party // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      tel: null == tel
          ? _value.tel
          : tel // ignore: cast_nullable_to_non_nullable
              as String,
      function: null == function
          ? _value.function
          : function // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LocalCouncilItemModel implements _LocalCouncilItemModel {
  const _$_LocalCouncilItemModel(
      {@JsonKey(name: 'name', defaultValue: '') required this.name,
      @JsonKey(name: 'url', defaultValue: '') required this.imageUrl,
      @JsonKey(name: 'party', defaultValue: '') required this.party,
      @JsonKey(name: 'email', defaultValue: '') required this.email,
      @JsonKey(name: 'phone_number', defaultValue: '') required this.tel,
      @JsonKey(name: 'function', defaultValue: '') required this.function});

  factory _$_LocalCouncilItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_LocalCouncilItemModelFromJson(json);

  @override
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @override
  @JsonKey(name: 'url', defaultValue: '')
  final String imageUrl;
  @override
  @JsonKey(name: 'party', defaultValue: '')
  final String party;
  @override
  @JsonKey(name: 'email', defaultValue: '')
  final String email;
  @override
  @JsonKey(name: 'phone_number', defaultValue: '')
  final String tel;
  @override
  @JsonKey(name: 'function', defaultValue: '')
  final String function;

  @override
  String toString() {
    return 'LocalCouncilItemModel(name: $name, imageUrl: $imageUrl, party: $party, email: $email, tel: $tel, function: $function)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocalCouncilItemModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.party, party) || other.party == party) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.tel, tel) || other.tel == tel) &&
            (identical(other.function, function) ||
                other.function == function));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, imageUrl, party, email, tel, function);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocalCouncilItemModelCopyWith<_$_LocalCouncilItemModel> get copyWith =>
      __$$_LocalCouncilItemModelCopyWithImpl<_$_LocalCouncilItemModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocalCouncilItemModelToJson(
      this,
    );
  }
}

abstract class _LocalCouncilItemModel implements LocalCouncilItemModel {
  const factory _LocalCouncilItemModel(
      {@JsonKey(name: 'name', defaultValue: '')
          required final String name,
      @JsonKey(name: 'url', defaultValue: '')
          required final String imageUrl,
      @JsonKey(name: 'party', defaultValue: '')
          required final String party,
      @JsonKey(name: 'email', defaultValue: '')
          required final String email,
      @JsonKey(name: 'phone_number', defaultValue: '')
          required final String tel,
      @JsonKey(name: 'function', defaultValue: '')
          required final String function}) = _$_LocalCouncilItemModel;

  factory _LocalCouncilItemModel.fromJson(Map<String, dynamic> json) =
      _$_LocalCouncilItemModel.fromJson;

  @override
  @JsonKey(name: 'name', defaultValue: '')
  String get name;
  @override
  @JsonKey(name: 'url', defaultValue: '')
  String get imageUrl;
  @override
  @JsonKey(name: 'party', defaultValue: '')
  String get party;
  @override
  @JsonKey(name: 'email', defaultValue: '')
  String get email;
  @override
  @JsonKey(name: 'phone_number', defaultValue: '')
  String get tel;
  @override
  @JsonKey(name: 'function', defaultValue: '')
  String get function;
  @override
  @JsonKey(ignore: true)
  _$$_LocalCouncilItemModelCopyWith<_$_LocalCouncilItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
