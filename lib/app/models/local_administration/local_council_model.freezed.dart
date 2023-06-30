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
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get party => throw _privateConstructorUsedError;
  List<String> get wealth => throw _privateConstructorUsedError;
  List<String> get interests => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String get fbUrl => throw _privateConstructorUsedError;

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
      {String name,
      String imageUrl,
      String party,
      List<String> wealth,
      List<String> interests,
      String? email,
      String? phoneNumber,
      String fbUrl});
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
    Object? name = null,
    Object? imageUrl = null,
    Object? party = null,
    Object? wealth = null,
    Object? interests = null,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? fbUrl = null,
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
      wealth: null == wealth
          ? _value.wealth
          : wealth // ignore: cast_nullable_to_non_nullable
              as List<String>,
      interests: null == interests
          ? _value.interests
          : interests // ignore: cast_nullable_to_non_nullable
              as List<String>,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      fbUrl: null == fbUrl
          ? _value.fbUrl
          : fbUrl // ignore: cast_nullable_to_non_nullable
              as String,
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
      {String name,
      String imageUrl,
      String party,
      List<String> wealth,
      List<String> interests,
      String? email,
      String? phoneNumber,
      String fbUrl});
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
    Object? name = null,
    Object? imageUrl = null,
    Object? party = null,
    Object? wealth = null,
    Object? interests = null,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? fbUrl = null,
  }) {
    return _then(_$_LocalCouncilModel(
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
      wealth: null == wealth
          ? _value._wealth
          : wealth // ignore: cast_nullable_to_non_nullable
              as List<String>,
      interests: null == interests
          ? _value._interests
          : interests // ignore: cast_nullable_to_non_nullable
              as List<String>,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      fbUrl: null == fbUrl
          ? _value.fbUrl
          : fbUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LocalCouncilModel implements _LocalCouncilModel {
  const _$_LocalCouncilModel(
      {required this.name,
      required this.imageUrl,
      required this.party,
      required final List<String> wealth,
      required final List<String> interests,
      required this.email,
      required this.phoneNumber,
      required this.fbUrl})
      : _wealth = wealth,
        _interests = interests;

  factory _$_LocalCouncilModel.fromJson(Map<String, dynamic> json) =>
      _$$_LocalCouncilModelFromJson(json);

  @override
  final String name;
  @override
  final String imageUrl;
  @override
  final String party;
  final List<String> _wealth;
  @override
  List<String> get wealth {
    if (_wealth is EqualUnmodifiableListView) return _wealth;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wealth);
  }

  final List<String> _interests;
  @override
  List<String> get interests {
    if (_interests is EqualUnmodifiableListView) return _interests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_interests);
  }

  @override
  final String? email;
  @override
  final String? phoneNumber;
  @override
  final String fbUrl;

  @override
  String toString() {
    return 'LocalCouncilModel(name: $name, imageUrl: $imageUrl, party: $party, wealth: $wealth, interests: $interests, email: $email, phoneNumber: $phoneNumber, fbUrl: $fbUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocalCouncilModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.party, party) || other.party == party) &&
            const DeepCollectionEquality().equals(other._wealth, _wealth) &&
            const DeepCollectionEquality()
                .equals(other._interests, _interests) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.fbUrl, fbUrl) || other.fbUrl == fbUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      imageUrl,
      party,
      const DeepCollectionEquality().hash(_wealth),
      const DeepCollectionEquality().hash(_interests),
      email,
      phoneNumber,
      fbUrl);

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
      {required final String name,
      required final String imageUrl,
      required final String party,
      required final List<String> wealth,
      required final List<String> interests,
      required final String? email,
      required final String? phoneNumber,
      required final String fbUrl}) = _$_LocalCouncilModel;

  factory _LocalCouncilModel.fromJson(Map<String, dynamic> json) =
      _$_LocalCouncilModel.fromJson;

  @override
  String get name;
  @override
  String get imageUrl;
  @override
  String get party;
  @override
  List<String> get wealth;
  @override
  List<String> get interests;
  @override
  String? get email;
  @override
  String? get phoneNumber;
  @override
  String get fbUrl;
  @override
  @JsonKey(ignore: true)
  _$$_LocalCouncilModelCopyWith<_$_LocalCouncilModel> get copyWith =>
      throw _privateConstructorUsedError;
}
