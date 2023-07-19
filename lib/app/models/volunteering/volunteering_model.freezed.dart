// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'volunteering_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VolunteeringModel _$VolunteeringModelFromJson(Map<String, dynamic> json) {
  return _VolunteeringModel.fromJson(json);
}

/// @nodoc
mixin _$VolunteeringModel {
  @JsonKey(name: 'volunteering', defaultValue: [])
  List<VolunteeringItemModel> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VolunteeringModelCopyWith<VolunteeringModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VolunteeringModelCopyWith<$Res> {
  factory $VolunteeringModelCopyWith(
          VolunteeringModel value, $Res Function(VolunteeringModel) then) =
      _$VolunteeringModelCopyWithImpl<$Res, VolunteeringModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'volunteering', defaultValue: [])
          List<VolunteeringItemModel> items});
}

/// @nodoc
class _$VolunteeringModelCopyWithImpl<$Res, $Val extends VolunteeringModel>
    implements $VolunteeringModelCopyWith<$Res> {
  _$VolunteeringModelCopyWithImpl(this._value, this._then);

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
              as List<VolunteeringItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VolunteeringModelCopyWith<$Res>
    implements $VolunteeringModelCopyWith<$Res> {
  factory _$$_VolunteeringModelCopyWith(_$_VolunteeringModel value,
          $Res Function(_$_VolunteeringModel) then) =
      __$$_VolunteeringModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'volunteering', defaultValue: [])
          List<VolunteeringItemModel> items});
}

/// @nodoc
class __$$_VolunteeringModelCopyWithImpl<$Res>
    extends _$VolunteeringModelCopyWithImpl<$Res, _$_VolunteeringModel>
    implements _$$_VolunteeringModelCopyWith<$Res> {
  __$$_VolunteeringModelCopyWithImpl(
      _$_VolunteeringModel _value, $Res Function(_$_VolunteeringModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$_VolunteeringModel(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<VolunteeringItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VolunteeringModel implements _VolunteeringModel {
  const _$_VolunteeringModel(
      {@JsonKey(name: 'volunteering', defaultValue: [])
          required final List<VolunteeringItemModel> items})
      : _items = items;

  factory _$_VolunteeringModel.fromJson(Map<String, dynamic> json) =>
      _$$_VolunteeringModelFromJson(json);

  final List<VolunteeringItemModel> _items;
  @override
  @JsonKey(name: 'volunteering', defaultValue: [])
  List<VolunteeringItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'VolunteeringModel(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VolunteeringModel &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VolunteeringModelCopyWith<_$_VolunteeringModel> get copyWith =>
      __$$_VolunteeringModelCopyWithImpl<_$_VolunteeringModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VolunteeringModelToJson(
      this,
    );
  }
}

abstract class _VolunteeringModel implements VolunteeringModel {
  const factory _VolunteeringModel(
          {@JsonKey(name: 'volunteering', defaultValue: [])
              required final List<VolunteeringItemModel> items}) =
      _$_VolunteeringModel;

  factory _VolunteeringModel.fromJson(Map<String, dynamic> json) =
      _$_VolunteeringModel.fromJson;

  @override
  @JsonKey(name: 'volunteering', defaultValue: [])
  List<VolunteeringItemModel> get items;
  @override
  @JsonKey(ignore: true)
  _$$_VolunteeringModelCopyWith<_$_VolunteeringModel> get copyWith =>
      throw _privateConstructorUsedError;
}

VolunteeringItemModel _$VolunteeringItemModelFromJson(
    Map<String, dynamic> json) {
  return _VolunteeringItemModel.fromJson(json);
}

/// @nodoc
mixin _$VolunteeringItemModel {
  @JsonKey(name: 'email', defaultValue: '')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'image', defaultValue: '')
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'name', defaultValue: '')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number', defaultValue: '')
  String get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'website', defaultValue: '')
  String get website => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VolunteeringItemModelCopyWith<VolunteeringItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VolunteeringItemModelCopyWith<$Res> {
  factory $VolunteeringItemModelCopyWith(VolunteeringItemModel value,
          $Res Function(VolunteeringItemModel) then) =
      _$VolunteeringItemModelCopyWithImpl<$Res, VolunteeringItemModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'email', defaultValue: '') String email,
      @JsonKey(name: 'image', defaultValue: '') String image,
      @JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(name: 'phone_number', defaultValue: '') String phoneNumber,
      @JsonKey(name: 'website', defaultValue: '') String website});
}

/// @nodoc
class _$VolunteeringItemModelCopyWithImpl<$Res,
        $Val extends VolunteeringItemModel>
    implements $VolunteeringItemModelCopyWith<$Res> {
  _$VolunteeringItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? image = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? website = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      website: null == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VolunteeringItemModelCopyWith<$Res>
    implements $VolunteeringItemModelCopyWith<$Res> {
  factory _$$_VolunteeringItemModelCopyWith(_$_VolunteeringItemModel value,
          $Res Function(_$_VolunteeringItemModel) then) =
      __$$_VolunteeringItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'email', defaultValue: '') String email,
      @JsonKey(name: 'image', defaultValue: '') String image,
      @JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(name: 'phone_number', defaultValue: '') String phoneNumber,
      @JsonKey(name: 'website', defaultValue: '') String website});
}

/// @nodoc
class __$$_VolunteeringItemModelCopyWithImpl<$Res>
    extends _$VolunteeringItemModelCopyWithImpl<$Res, _$_VolunteeringItemModel>
    implements _$$_VolunteeringItemModelCopyWith<$Res> {
  __$$_VolunteeringItemModelCopyWithImpl(_$_VolunteeringItemModel _value,
      $Res Function(_$_VolunteeringItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? image = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? website = null,
  }) {
    return _then(_$_VolunteeringItemModel(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      website: null == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VolunteeringItemModel implements _VolunteeringItemModel {
  const _$_VolunteeringItemModel(
      {@JsonKey(name: 'email', defaultValue: '')
          required this.email,
      @JsonKey(name: 'image', defaultValue: '')
          required this.image,
      @JsonKey(name: 'name', defaultValue: '')
          required this.name,
      @JsonKey(name: 'phone_number', defaultValue: '')
          required this.phoneNumber,
      @JsonKey(name: 'website', defaultValue: '')
          required this.website});

  factory _$_VolunteeringItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_VolunteeringItemModelFromJson(json);

  @override
  @JsonKey(name: 'email', defaultValue: '')
  final String email;
  @override
  @JsonKey(name: 'image', defaultValue: '')
  final String image;
  @override
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @override
  @JsonKey(name: 'phone_number', defaultValue: '')
  final String phoneNumber;
  @override
  @JsonKey(name: 'website', defaultValue: '')
  final String website;

  @override
  String toString() {
    return 'VolunteeringItemModel(email: $email, image: $image, name: $name, phoneNumber: $phoneNumber, website: $website)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VolunteeringItemModel &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.website, website) || other.website == website));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email, image, name, phoneNumber, website);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VolunteeringItemModelCopyWith<_$_VolunteeringItemModel> get copyWith =>
      __$$_VolunteeringItemModelCopyWithImpl<_$_VolunteeringItemModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VolunteeringItemModelToJson(
      this,
    );
  }
}

abstract class _VolunteeringItemModel implements VolunteeringItemModel {
  const factory _VolunteeringItemModel(
      {@JsonKey(name: 'email', defaultValue: '')
          required final String email,
      @JsonKey(name: 'image', defaultValue: '')
          required final String image,
      @JsonKey(name: 'name', defaultValue: '')
          required final String name,
      @JsonKey(name: 'phone_number', defaultValue: '')
          required final String phoneNumber,
      @JsonKey(name: 'website', defaultValue: '')
          required final String website}) = _$_VolunteeringItemModel;

  factory _VolunteeringItemModel.fromJson(Map<String, dynamic> json) =
      _$_VolunteeringItemModel.fromJson;

  @override
  @JsonKey(name: 'email', defaultValue: '')
  String get email;
  @override
  @JsonKey(name: 'image', defaultValue: '')
  String get image;
  @override
  @JsonKey(name: 'name', defaultValue: '')
  String get name;
  @override
  @JsonKey(name: 'phone_number', defaultValue: '')
  String get phoneNumber;
  @override
  @JsonKey(name: 'website', defaultValue: '')
  String get website;
  @override
  @JsonKey(ignore: true)
  _$$_VolunteeringItemModelCopyWith<_$_VolunteeringItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
