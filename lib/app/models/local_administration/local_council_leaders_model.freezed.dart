// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_council_leaders_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocalCouncilLeadersModel _$LocalCouncilLeadersModelFromJson(
    Map<String, dynamic> json) {
  return _LocalCouncilLeadersModel.fromJson(json);
}

/// @nodoc
mixin _$LocalCouncilLeadersModel {
  @JsonKey(name: 'leaders', defaultValue: [])
  List<LocalCouncilLeadersItemModel> get items =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalCouncilLeadersModelCopyWith<LocalCouncilLeadersModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalCouncilLeadersModelCopyWith<$Res> {
  factory $LocalCouncilLeadersModelCopyWith(LocalCouncilLeadersModel value,
          $Res Function(LocalCouncilLeadersModel) then) =
      _$LocalCouncilLeadersModelCopyWithImpl<$Res, LocalCouncilLeadersModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'leaders', defaultValue: [])
          List<LocalCouncilLeadersItemModel> items});
}

/// @nodoc
class _$LocalCouncilLeadersModelCopyWithImpl<$Res,
        $Val extends LocalCouncilLeadersModel>
    implements $LocalCouncilLeadersModelCopyWith<$Res> {
  _$LocalCouncilLeadersModelCopyWithImpl(this._value, this._then);

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
              as List<LocalCouncilLeadersItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocalCouncilLeadersModelCopyWith<$Res>
    implements $LocalCouncilLeadersModelCopyWith<$Res> {
  factory _$$_LocalCouncilLeadersModelCopyWith(
          _$_LocalCouncilLeadersModel value,
          $Res Function(_$_LocalCouncilLeadersModel) then) =
      __$$_LocalCouncilLeadersModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'leaders', defaultValue: [])
          List<LocalCouncilLeadersItemModel> items});
}

/// @nodoc
class __$$_LocalCouncilLeadersModelCopyWithImpl<$Res>
    extends _$LocalCouncilLeadersModelCopyWithImpl<$Res,
        _$_LocalCouncilLeadersModel>
    implements _$$_LocalCouncilLeadersModelCopyWith<$Res> {
  __$$_LocalCouncilLeadersModelCopyWithImpl(_$_LocalCouncilLeadersModel _value,
      $Res Function(_$_LocalCouncilLeadersModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$_LocalCouncilLeadersModel(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<LocalCouncilLeadersItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LocalCouncilLeadersModel implements _LocalCouncilLeadersModel {
  const _$_LocalCouncilLeadersModel(
      {@JsonKey(name: 'leaders', defaultValue: [])
          required final List<LocalCouncilLeadersItemModel> items})
      : _items = items;

  factory _$_LocalCouncilLeadersModel.fromJson(Map<String, dynamic> json) =>
      _$$_LocalCouncilLeadersModelFromJson(json);

  final List<LocalCouncilLeadersItemModel> _items;
  @override
  @JsonKey(name: 'leaders', defaultValue: [])
  List<LocalCouncilLeadersItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'LocalCouncilLeadersModel(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocalCouncilLeadersModel &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocalCouncilLeadersModelCopyWith<_$_LocalCouncilLeadersModel>
      get copyWith => __$$_LocalCouncilLeadersModelCopyWithImpl<
          _$_LocalCouncilLeadersModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocalCouncilLeadersModelToJson(
      this,
    );
  }
}

abstract class _LocalCouncilLeadersModel implements LocalCouncilLeadersModel {
  const factory _LocalCouncilLeadersModel(
          {@JsonKey(name: 'leaders', defaultValue: [])
              required final List<LocalCouncilLeadersItemModel> items}) =
      _$_LocalCouncilLeadersModel;

  factory _LocalCouncilLeadersModel.fromJson(Map<String, dynamic> json) =
      _$_LocalCouncilLeadersModel.fromJson;

  @override
  @JsonKey(name: 'leaders', defaultValue: [])
  List<LocalCouncilLeadersItemModel> get items;
  @override
  @JsonKey(ignore: true)
  _$$_LocalCouncilLeadersModelCopyWith<_$_LocalCouncilLeadersModel>
      get copyWith => throw _privateConstructorUsedError;
}

LocalCouncilLeadersItemModel _$LocalCouncilLeadersItemModelFromJson(
    Map<String, dynamic> json) {
  return _LocalCouncilLeadersItemModel.fromJson(json);
}

/// @nodoc
mixin _$LocalCouncilLeadersItemModel {
  @JsonKey(name: 'name', defaultValue: '')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'url_img', defaultValue: '')
  String get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'url_fb', defaultValue: '')
  String get fbUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'email', defaultValue: '')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'function', defaultValue: '')
  String get function => throw _privateConstructorUsedError;
  @JsonKey(name: 'interests', defaultValue: '')
  String get interests => throw _privateConstructorUsedError;
  @JsonKey(name: 'wealth', defaultValue: '')
  String get wealth => throw _privateConstructorUsedError;
  @JsonKey(name: 'location', defaultValue: '')
  String get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalCouncilLeadersItemModelCopyWith<LocalCouncilLeadersItemModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalCouncilLeadersItemModelCopyWith<$Res> {
  factory $LocalCouncilLeadersItemModelCopyWith(
          LocalCouncilLeadersItemModel value,
          $Res Function(LocalCouncilLeadersItemModel) then) =
      _$LocalCouncilLeadersItemModelCopyWithImpl<$Res,
          LocalCouncilLeadersItemModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(name: 'url_img', defaultValue: '') String imageUrl,
      @JsonKey(name: 'url_fb', defaultValue: '') String fbUrl,
      @JsonKey(name: 'email', defaultValue: '') String email,
      @JsonKey(name: 'function', defaultValue: '') String function,
      @JsonKey(name: 'interests', defaultValue: '') String interests,
      @JsonKey(name: 'wealth', defaultValue: '') String wealth,
      @JsonKey(name: 'location', defaultValue: '') String location});
}

/// @nodoc
class _$LocalCouncilLeadersItemModelCopyWithImpl<$Res,
        $Val extends LocalCouncilLeadersItemModel>
    implements $LocalCouncilLeadersItemModelCopyWith<$Res> {
  _$LocalCouncilLeadersItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? imageUrl = null,
    Object? fbUrl = null,
    Object? email = null,
    Object? function = null,
    Object? interests = null,
    Object? wealth = null,
    Object? location = null,
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
      fbUrl: null == fbUrl
          ? _value.fbUrl
          : fbUrl // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      function: null == function
          ? _value.function
          : function // ignore: cast_nullable_to_non_nullable
              as String,
      interests: null == interests
          ? _value.interests
          : interests // ignore: cast_nullable_to_non_nullable
              as String,
      wealth: null == wealth
          ? _value.wealth
          : wealth // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocalCouncilLeadersItemModelCopyWith<$Res>
    implements $LocalCouncilLeadersItemModelCopyWith<$Res> {
  factory _$$_LocalCouncilLeadersItemModelCopyWith(
          _$_LocalCouncilLeadersItemModel value,
          $Res Function(_$_LocalCouncilLeadersItemModel) then) =
      __$$_LocalCouncilLeadersItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(name: 'url_img', defaultValue: '') String imageUrl,
      @JsonKey(name: 'url_fb', defaultValue: '') String fbUrl,
      @JsonKey(name: 'email', defaultValue: '') String email,
      @JsonKey(name: 'function', defaultValue: '') String function,
      @JsonKey(name: 'interests', defaultValue: '') String interests,
      @JsonKey(name: 'wealth', defaultValue: '') String wealth,
      @JsonKey(name: 'location', defaultValue: '') String location});
}

/// @nodoc
class __$$_LocalCouncilLeadersItemModelCopyWithImpl<$Res>
    extends _$LocalCouncilLeadersItemModelCopyWithImpl<$Res,
        _$_LocalCouncilLeadersItemModel>
    implements _$$_LocalCouncilLeadersItemModelCopyWith<$Res> {
  __$$_LocalCouncilLeadersItemModelCopyWithImpl(
      _$_LocalCouncilLeadersItemModel _value,
      $Res Function(_$_LocalCouncilLeadersItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? imageUrl = null,
    Object? fbUrl = null,
    Object? email = null,
    Object? function = null,
    Object? interests = null,
    Object? wealth = null,
    Object? location = null,
  }) {
    return _then(_$_LocalCouncilLeadersItemModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      fbUrl: null == fbUrl
          ? _value.fbUrl
          : fbUrl // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      function: null == function
          ? _value.function
          : function // ignore: cast_nullable_to_non_nullable
              as String,
      interests: null == interests
          ? _value.interests
          : interests // ignore: cast_nullable_to_non_nullable
              as String,
      wealth: null == wealth
          ? _value.wealth
          : wealth // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LocalCouncilLeadersItemModel implements _LocalCouncilLeadersItemModel {
  const _$_LocalCouncilLeadersItemModel(
      {@JsonKey(name: 'name', defaultValue: '') required this.name,
      @JsonKey(name: 'url_img', defaultValue: '') required this.imageUrl,
      @JsonKey(name: 'url_fb', defaultValue: '') required this.fbUrl,
      @JsonKey(name: 'email', defaultValue: '') required this.email,
      @JsonKey(name: 'function', defaultValue: '') required this.function,
      @JsonKey(name: 'interests', defaultValue: '') required this.interests,
      @JsonKey(name: 'wealth', defaultValue: '') required this.wealth,
      @JsonKey(name: 'location', defaultValue: '') required this.location});

  factory _$_LocalCouncilLeadersItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_LocalCouncilLeadersItemModelFromJson(json);

  @override
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @override
  @JsonKey(name: 'url_img', defaultValue: '')
  final String imageUrl;
  @override
  @JsonKey(name: 'url_fb', defaultValue: '')
  final String fbUrl;
  @override
  @JsonKey(name: 'email', defaultValue: '')
  final String email;
  @override
  @JsonKey(name: 'function', defaultValue: '')
  final String function;
  @override
  @JsonKey(name: 'interests', defaultValue: '')
  final String interests;
  @override
  @JsonKey(name: 'wealth', defaultValue: '')
  final String wealth;
  @override
  @JsonKey(name: 'location', defaultValue: '')
  final String location;

  @override
  String toString() {
    return 'LocalCouncilLeadersItemModel(name: $name, imageUrl: $imageUrl, fbUrl: $fbUrl, email: $email, function: $function, interests: $interests, wealth: $wealth, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocalCouncilLeadersItemModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.fbUrl, fbUrl) || other.fbUrl == fbUrl) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.function, function) ||
                other.function == function) &&
            (identical(other.interests, interests) ||
                other.interests == interests) &&
            (identical(other.wealth, wealth) || other.wealth == wealth) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, imageUrl, fbUrl, email,
      function, interests, wealth, location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocalCouncilLeadersItemModelCopyWith<_$_LocalCouncilLeadersItemModel>
      get copyWith => __$$_LocalCouncilLeadersItemModelCopyWithImpl<
          _$_LocalCouncilLeadersItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocalCouncilLeadersItemModelToJson(
      this,
    );
  }
}

abstract class _LocalCouncilLeadersItemModel
    implements LocalCouncilLeadersItemModel {
  const factory _LocalCouncilLeadersItemModel(
      {@JsonKey(name: 'name', defaultValue: '')
          required final String name,
      @JsonKey(name: 'url_img', defaultValue: '')
          required final String imageUrl,
      @JsonKey(name: 'url_fb', defaultValue: '')
          required final String fbUrl,
      @JsonKey(name: 'email', defaultValue: '')
          required final String email,
      @JsonKey(name: 'function', defaultValue: '')
          required final String function,
      @JsonKey(name: 'interests', defaultValue: '')
          required final String interests,
      @JsonKey(name: 'wealth', defaultValue: '')
          required final String wealth,
      @JsonKey(name: 'location', defaultValue: '')
          required final String location}) = _$_LocalCouncilLeadersItemModel;

  factory _LocalCouncilLeadersItemModel.fromJson(Map<String, dynamic> json) =
      _$_LocalCouncilLeadersItemModel.fromJson;

  @override
  @JsonKey(name: 'name', defaultValue: '')
  String get name;
  @override
  @JsonKey(name: 'url_img', defaultValue: '')
  String get imageUrl;
  @override
  @JsonKey(name: 'url_fb', defaultValue: '')
  String get fbUrl;
  @override
  @JsonKey(name: 'email', defaultValue: '')
  String get email;
  @override
  @JsonKey(name: 'function', defaultValue: '')
  String get function;
  @override
  @JsonKey(name: 'interests', defaultValue: '')
  String get interests;
  @override
  @JsonKey(name: 'wealth', defaultValue: '')
  String get wealth;
  @override
  @JsonKey(name: 'location', defaultValue: '')
  String get location;
  @override
  @JsonKey(ignore: true)
  _$$_LocalCouncilLeadersItemModelCopyWith<_$_LocalCouncilLeadersItemModel>
      get copyWith => throw _privateConstructorUsedError;
}
