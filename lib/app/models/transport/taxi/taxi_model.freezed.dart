// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'taxi_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaxiModel _$TaxiModelFromJson(Map<String, dynamic> json) {
  return _TaxiModel.fromJson(json);
}

/// @nodoc
mixin _$TaxiModel {
  @JsonKey(name: 'taxi', defaultValue: [])
  List<TaxiItemModel> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaxiModelCopyWith<TaxiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaxiModelCopyWith<$Res> {
  factory $TaxiModelCopyWith(TaxiModel value, $Res Function(TaxiModel) then) =
      _$TaxiModelCopyWithImpl<$Res, TaxiModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'taxi', defaultValue: []) List<TaxiItemModel> items});
}

/// @nodoc
class _$TaxiModelCopyWithImpl<$Res, $Val extends TaxiModel>
    implements $TaxiModelCopyWith<$Res> {
  _$TaxiModelCopyWithImpl(this._value, this._then);

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
              as List<TaxiItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TaxiModelCopyWith<$Res> implements $TaxiModelCopyWith<$Res> {
  factory _$$_TaxiModelCopyWith(
          _$_TaxiModel value, $Res Function(_$_TaxiModel) then) =
      __$$_TaxiModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'taxi', defaultValue: []) List<TaxiItemModel> items});
}

/// @nodoc
class __$$_TaxiModelCopyWithImpl<$Res>
    extends _$TaxiModelCopyWithImpl<$Res, _$_TaxiModel>
    implements _$$_TaxiModelCopyWith<$Res> {
  __$$_TaxiModelCopyWithImpl(
      _$_TaxiModel _value, $Res Function(_$_TaxiModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$_TaxiModel(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TaxiItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaxiModel implements _TaxiModel {
  const _$_TaxiModel(
      {@JsonKey(name: 'taxi', defaultValue: [])
          required final List<TaxiItemModel> items})
      : _items = items;

  factory _$_TaxiModel.fromJson(Map<String, dynamic> json) =>
      _$$_TaxiModelFromJson(json);

  final List<TaxiItemModel> _items;
  @override
  @JsonKey(name: 'taxi', defaultValue: [])
  List<TaxiItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'TaxiModel(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaxiModel &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaxiModelCopyWith<_$_TaxiModel> get copyWith =>
      __$$_TaxiModelCopyWithImpl<_$_TaxiModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaxiModelToJson(
      this,
    );
  }
}

abstract class _TaxiModel implements TaxiModel {
  const factory _TaxiModel(
      {@JsonKey(name: 'taxi', defaultValue: [])
          required final List<TaxiItemModel> items}) = _$_TaxiModel;

  factory _TaxiModel.fromJson(Map<String, dynamic> json) =
      _$_TaxiModel.fromJson;

  @override
  @JsonKey(name: 'taxi', defaultValue: [])
  List<TaxiItemModel> get items;
  @override
  @JsonKey(ignore: true)
  _$$_TaxiModelCopyWith<_$_TaxiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

TaxiItemModel _$TaxiItemModelFromJson(Map<String, dynamic> json) {
  return _TaxiItemModel.fromJson(json);
}

/// @nodoc
mixin _$TaxiItemModel {
  @JsonKey(name: 'car_type', defaultValue: '')
  String get model => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_name', defaultValue: '')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url', defaultValue: '')
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number', defaultValue: '')
  String get tel => throw _privateConstructorUsedError;
  @JsonKey(name: 'plate_number', defaultValue: '')
  String get plate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaxiItemModelCopyWith<TaxiItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaxiItemModelCopyWith<$Res> {
  factory $TaxiItemModelCopyWith(
          TaxiItemModel value, $Res Function(TaxiItemModel) then) =
      _$TaxiItemModelCopyWithImpl<$Res, TaxiItemModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'car_type', defaultValue: '') String model,
      @JsonKey(name: 'driver_name', defaultValue: '') String name,
      @JsonKey(name: 'image_url', defaultValue: '') String url,
      @JsonKey(name: 'phone_number', defaultValue: '') String tel,
      @JsonKey(name: 'plate_number', defaultValue: '') String plate});
}

/// @nodoc
class _$TaxiItemModelCopyWithImpl<$Res, $Val extends TaxiItemModel>
    implements $TaxiItemModelCopyWith<$Res> {
  _$TaxiItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? name = null,
    Object? url = null,
    Object? tel = null,
    Object? plate = null,
  }) {
    return _then(_value.copyWith(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      tel: null == tel
          ? _value.tel
          : tel // ignore: cast_nullable_to_non_nullable
              as String,
      plate: null == plate
          ? _value.plate
          : plate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TaxiItemModelCopyWith<$Res>
    implements $TaxiItemModelCopyWith<$Res> {
  factory _$$_TaxiItemModelCopyWith(
          _$_TaxiItemModel value, $Res Function(_$_TaxiItemModel) then) =
      __$$_TaxiItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'car_type', defaultValue: '') String model,
      @JsonKey(name: 'driver_name', defaultValue: '') String name,
      @JsonKey(name: 'image_url', defaultValue: '') String url,
      @JsonKey(name: 'phone_number', defaultValue: '') String tel,
      @JsonKey(name: 'plate_number', defaultValue: '') String plate});
}

/// @nodoc
class __$$_TaxiItemModelCopyWithImpl<$Res>
    extends _$TaxiItemModelCopyWithImpl<$Res, _$_TaxiItemModel>
    implements _$$_TaxiItemModelCopyWith<$Res> {
  __$$_TaxiItemModelCopyWithImpl(
      _$_TaxiItemModel _value, $Res Function(_$_TaxiItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? name = null,
    Object? url = null,
    Object? tel = null,
    Object? plate = null,
  }) {
    return _then(_$_TaxiItemModel(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      tel: null == tel
          ? _value.tel
          : tel // ignore: cast_nullable_to_non_nullable
              as String,
      plate: null == plate
          ? _value.plate
          : plate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaxiItemModel implements _TaxiItemModel {
  const _$_TaxiItemModel(
      {@JsonKey(name: 'car_type', defaultValue: '') required this.model,
      @JsonKey(name: 'driver_name', defaultValue: '') required this.name,
      @JsonKey(name: 'image_url', defaultValue: '') required this.url,
      @JsonKey(name: 'phone_number', defaultValue: '') required this.tel,
      @JsonKey(name: 'plate_number', defaultValue: '') required this.plate});

  factory _$_TaxiItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_TaxiItemModelFromJson(json);

  @override
  @JsonKey(name: 'car_type', defaultValue: '')
  final String model;
  @override
  @JsonKey(name: 'driver_name', defaultValue: '')
  final String name;
  @override
  @JsonKey(name: 'image_url', defaultValue: '')
  final String url;
  @override
  @JsonKey(name: 'phone_number', defaultValue: '')
  final String tel;
  @override
  @JsonKey(name: 'plate_number', defaultValue: '')
  final String plate;

  @override
  String toString() {
    return 'TaxiItemModel(model: $model, name: $name, url: $url, tel: $tel, plate: $plate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaxiItemModel &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.tel, tel) || other.tel == tel) &&
            (identical(other.plate, plate) || other.plate == plate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, model, name, url, tel, plate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaxiItemModelCopyWith<_$_TaxiItemModel> get copyWith =>
      __$$_TaxiItemModelCopyWithImpl<_$_TaxiItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaxiItemModelToJson(
      this,
    );
  }
}

abstract class _TaxiItemModel implements TaxiItemModel {
  const factory _TaxiItemModel(
      {@JsonKey(name: 'car_type', defaultValue: '')
          required final String model,
      @JsonKey(name: 'driver_name', defaultValue: '')
          required final String name,
      @JsonKey(name: 'image_url', defaultValue: '')
          required final String url,
      @JsonKey(name: 'phone_number', defaultValue: '')
          required final String tel,
      @JsonKey(name: 'plate_number', defaultValue: '')
          required final String plate}) = _$_TaxiItemModel;

  factory _TaxiItemModel.fromJson(Map<String, dynamic> json) =
      _$_TaxiItemModel.fromJson;

  @override
  @JsonKey(name: 'car_type', defaultValue: '')
  String get model;
  @override
  @JsonKey(name: 'driver_name', defaultValue: '')
  String get name;
  @override
  @JsonKey(name: 'image_url', defaultValue: '')
  String get url;
  @override
  @JsonKey(name: 'phone_number', defaultValue: '')
  String get tel;
  @override
  @JsonKey(name: 'plate_number', defaultValue: '')
  String get plate;
  @override
  @JsonKey(ignore: true)
  _$$_TaxiItemModelCopyWith<_$_TaxiItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
