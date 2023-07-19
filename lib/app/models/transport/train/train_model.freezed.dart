// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'train_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TrainModel _$TrainModelFromJson(Map<String, dynamic> json) {
  return _TrainModel.fromJson(json);
}

/// @nodoc
mixin _$TrainModel {
  @JsonKey(name: 'trains', defaultValue: [])
  List<TrainItemModel> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrainModelCopyWith<TrainModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainModelCopyWith<$Res> {
  factory $TrainModelCopyWith(
          TrainModel value, $Res Function(TrainModel) then) =
      _$TrainModelCopyWithImpl<$Res, TrainModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'trains', defaultValue: []) List<TrainItemModel> items});
}

/// @nodoc
class _$TrainModelCopyWithImpl<$Res, $Val extends TrainModel>
    implements $TrainModelCopyWith<$Res> {
  _$TrainModelCopyWithImpl(this._value, this._then);

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
              as List<TrainItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TrainModelCopyWith<$Res>
    implements $TrainModelCopyWith<$Res> {
  factory _$$_TrainModelCopyWith(
          _$_TrainModel value, $Res Function(_$_TrainModel) then) =
      __$$_TrainModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'trains', defaultValue: []) List<TrainItemModel> items});
}

/// @nodoc
class __$$_TrainModelCopyWithImpl<$Res>
    extends _$TrainModelCopyWithImpl<$Res, _$_TrainModel>
    implements _$$_TrainModelCopyWith<$Res> {
  __$$_TrainModelCopyWithImpl(
      _$_TrainModel _value, $Res Function(_$_TrainModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$_TrainModel(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TrainItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TrainModel implements _TrainModel {
  const _$_TrainModel(
      {@JsonKey(name: 'trains', defaultValue: [])
          required final List<TrainItemModel> items})
      : _items = items;

  factory _$_TrainModel.fromJson(Map<String, dynamic> json) =>
      _$$_TrainModelFromJson(json);

  final List<TrainItemModel> _items;
  @override
  @JsonKey(name: 'trains', defaultValue: [])
  List<TrainItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'TrainModel(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TrainModel &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TrainModelCopyWith<_$_TrainModel> get copyWith =>
      __$$_TrainModelCopyWithImpl<_$_TrainModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TrainModelToJson(
      this,
    );
  }
}

abstract class _TrainModel implements TrainModel {
  const factory _TrainModel(
      {@JsonKey(name: 'trains', defaultValue: [])
          required final List<TrainItemModel> items}) = _$_TrainModel;

  factory _TrainModel.fromJson(Map<String, dynamic> json) =
      _$_TrainModel.fromJson;

  @override
  @JsonKey(name: 'trains', defaultValue: [])
  List<TrainItemModel> get items;
  @override
  @JsonKey(ignore: true)
  _$$_TrainModelCopyWith<_$_TrainModel> get copyWith =>
      throw _privateConstructorUsedError;
}

TrainItemModel _$TrainItemModelFromJson(Map<String, dynamic> json) {
  return _TrainItemModel.fromJson(json);
}

/// @nodoc
mixin _$TrainItemModel {
  @JsonKey(name: 'train_nr', defaultValue: '')
  String get trainNr => throw _privateConstructorUsedError;
  @JsonKey(name: 'train_category', defaultValue: '')
  String get trainCategory => throw _privateConstructorUsedError;
  @JsonKey(name: 'stations', defaultValue: [])
  List<StationsItemModel> get stations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrainItemModelCopyWith<TrainItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainItemModelCopyWith<$Res> {
  factory $TrainItemModelCopyWith(
          TrainItemModel value, $Res Function(TrainItemModel) then) =
      _$TrainItemModelCopyWithImpl<$Res, TrainItemModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'train_nr', defaultValue: '')
          String trainNr,
      @JsonKey(name: 'train_category', defaultValue: '')
          String trainCategory,
      @JsonKey(name: 'stations', defaultValue: [])
          List<StationsItemModel> stations});
}

/// @nodoc
class _$TrainItemModelCopyWithImpl<$Res, $Val extends TrainItemModel>
    implements $TrainItemModelCopyWith<$Res> {
  _$TrainItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trainNr = null,
    Object? trainCategory = null,
    Object? stations = null,
  }) {
    return _then(_value.copyWith(
      trainNr: null == trainNr
          ? _value.trainNr
          : trainNr // ignore: cast_nullable_to_non_nullable
              as String,
      trainCategory: null == trainCategory
          ? _value.trainCategory
          : trainCategory // ignore: cast_nullable_to_non_nullable
              as String,
      stations: null == stations
          ? _value.stations
          : stations // ignore: cast_nullable_to_non_nullable
              as List<StationsItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TrainItemModelCopyWith<$Res>
    implements $TrainItemModelCopyWith<$Res> {
  factory _$$_TrainItemModelCopyWith(
          _$_TrainItemModel value, $Res Function(_$_TrainItemModel) then) =
      __$$_TrainItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'train_nr', defaultValue: '')
          String trainNr,
      @JsonKey(name: 'train_category', defaultValue: '')
          String trainCategory,
      @JsonKey(name: 'stations', defaultValue: [])
          List<StationsItemModel> stations});
}

/// @nodoc
class __$$_TrainItemModelCopyWithImpl<$Res>
    extends _$TrainItemModelCopyWithImpl<$Res, _$_TrainItemModel>
    implements _$$_TrainItemModelCopyWith<$Res> {
  __$$_TrainItemModelCopyWithImpl(
      _$_TrainItemModel _value, $Res Function(_$_TrainItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trainNr = null,
    Object? trainCategory = null,
    Object? stations = null,
  }) {
    return _then(_$_TrainItemModel(
      trainNr: null == trainNr
          ? _value.trainNr
          : trainNr // ignore: cast_nullable_to_non_nullable
              as String,
      trainCategory: null == trainCategory
          ? _value.trainCategory
          : trainCategory // ignore: cast_nullable_to_non_nullable
              as String,
      stations: null == stations
          ? _value._stations
          : stations // ignore: cast_nullable_to_non_nullable
              as List<StationsItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TrainItemModel implements _TrainItemModel {
  const _$_TrainItemModel(
      {@JsonKey(name: 'train_nr', defaultValue: '')
          required this.trainNr,
      @JsonKey(name: 'train_category', defaultValue: '')
          required this.trainCategory,
      @JsonKey(name: 'stations', defaultValue: [])
          required final List<StationsItemModel> stations})
      : _stations = stations;

  factory _$_TrainItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_TrainItemModelFromJson(json);

  @override
  @JsonKey(name: 'train_nr', defaultValue: '')
  final String trainNr;
  @override
  @JsonKey(name: 'train_category', defaultValue: '')
  final String trainCategory;
  final List<StationsItemModel> _stations;
  @override
  @JsonKey(name: 'stations', defaultValue: [])
  List<StationsItemModel> get stations {
    if (_stations is EqualUnmodifiableListView) return _stations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stations);
  }

  @override
  String toString() {
    return 'TrainItemModel(trainNr: $trainNr, trainCategory: $trainCategory, stations: $stations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TrainItemModel &&
            (identical(other.trainNr, trainNr) || other.trainNr == trainNr) &&
            (identical(other.trainCategory, trainCategory) ||
                other.trainCategory == trainCategory) &&
            const DeepCollectionEquality().equals(other._stations, _stations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, trainNr, trainCategory,
      const DeepCollectionEquality().hash(_stations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TrainItemModelCopyWith<_$_TrainItemModel> get copyWith =>
      __$$_TrainItemModelCopyWithImpl<_$_TrainItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TrainItemModelToJson(
      this,
    );
  }
}

abstract class _TrainItemModel implements TrainItemModel {
  const factory _TrainItemModel(
      {@JsonKey(name: 'train_nr', defaultValue: '')
          required final String trainNr,
      @JsonKey(name: 'train_category', defaultValue: '')
          required final String trainCategory,
      @JsonKey(name: 'stations', defaultValue: [])
          required final List<StationsItemModel> stations}) = _$_TrainItemModel;

  factory _TrainItemModel.fromJson(Map<String, dynamic> json) =
      _$_TrainItemModel.fromJson;

  @override
  @JsonKey(name: 'train_nr', defaultValue: '')
  String get trainNr;
  @override
  @JsonKey(name: 'train_category', defaultValue: '')
  String get trainCategory;
  @override
  @JsonKey(name: 'stations', defaultValue: [])
  List<StationsItemModel> get stations;
  @override
  @JsonKey(ignore: true)
  _$$_TrainItemModelCopyWith<_$_TrainItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

StationsItemModel _$StationsItemModelFromJson(Map<String, dynamic> json) {
  return _StationsItemModel.fromJson(json);
}

/// @nodoc
mixin _$StationsItemModel {
  @JsonKey(name: 'arrival_station', defaultValue: '')
  String get aStation => throw _privateConstructorUsedError;
  @JsonKey(name: 'arrival_time', defaultValue: '')
  String get aTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'departure_station', defaultValue: '')
  String get dStation => throw _privateConstructorUsedError;
  @JsonKey(name: 'departure_time', defaultValue: '')
  String get dTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StationsItemModelCopyWith<StationsItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationsItemModelCopyWith<$Res> {
  factory $StationsItemModelCopyWith(
          StationsItemModel value, $Res Function(StationsItemModel) then) =
      _$StationsItemModelCopyWithImpl<$Res, StationsItemModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'arrival_station', defaultValue: '') String aStation,
      @JsonKey(name: 'arrival_time', defaultValue: '') String aTime,
      @JsonKey(name: 'departure_station', defaultValue: '') String dStation,
      @JsonKey(name: 'departure_time', defaultValue: '') String dTime});
}

/// @nodoc
class _$StationsItemModelCopyWithImpl<$Res, $Val extends StationsItemModel>
    implements $StationsItemModelCopyWith<$Res> {
  _$StationsItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aStation = null,
    Object? aTime = null,
    Object? dStation = null,
    Object? dTime = null,
  }) {
    return _then(_value.copyWith(
      aStation: null == aStation
          ? _value.aStation
          : aStation // ignore: cast_nullable_to_non_nullable
              as String,
      aTime: null == aTime
          ? _value.aTime
          : aTime // ignore: cast_nullable_to_non_nullable
              as String,
      dStation: null == dStation
          ? _value.dStation
          : dStation // ignore: cast_nullable_to_non_nullable
              as String,
      dTime: null == dTime
          ? _value.dTime
          : dTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StationsItemModelCopyWith<$Res>
    implements $StationsItemModelCopyWith<$Res> {
  factory _$$_StationsItemModelCopyWith(_$_StationsItemModel value,
          $Res Function(_$_StationsItemModel) then) =
      __$$_StationsItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'arrival_station', defaultValue: '') String aStation,
      @JsonKey(name: 'arrival_time', defaultValue: '') String aTime,
      @JsonKey(name: 'departure_station', defaultValue: '') String dStation,
      @JsonKey(name: 'departure_time', defaultValue: '') String dTime});
}

/// @nodoc
class __$$_StationsItemModelCopyWithImpl<$Res>
    extends _$StationsItemModelCopyWithImpl<$Res, _$_StationsItemModel>
    implements _$$_StationsItemModelCopyWith<$Res> {
  __$$_StationsItemModelCopyWithImpl(
      _$_StationsItemModel _value, $Res Function(_$_StationsItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aStation = null,
    Object? aTime = null,
    Object? dStation = null,
    Object? dTime = null,
  }) {
    return _then(_$_StationsItemModel(
      aStation: null == aStation
          ? _value.aStation
          : aStation // ignore: cast_nullable_to_non_nullable
              as String,
      aTime: null == aTime
          ? _value.aTime
          : aTime // ignore: cast_nullable_to_non_nullable
              as String,
      dStation: null == dStation
          ? _value.dStation
          : dStation // ignore: cast_nullable_to_non_nullable
              as String,
      dTime: null == dTime
          ? _value.dTime
          : dTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StationsItemModel implements _StationsItemModel {
  const _$_StationsItemModel(
      {@JsonKey(name: 'arrival_station', defaultValue: '')
          required this.aStation,
      @JsonKey(name: 'arrival_time', defaultValue: '')
          required this.aTime,
      @JsonKey(name: 'departure_station', defaultValue: '')
          required this.dStation,
      @JsonKey(name: 'departure_time', defaultValue: '')
          required this.dTime});

  factory _$_StationsItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_StationsItemModelFromJson(json);

  @override
  @JsonKey(name: 'arrival_station', defaultValue: '')
  final String aStation;
  @override
  @JsonKey(name: 'arrival_time', defaultValue: '')
  final String aTime;
  @override
  @JsonKey(name: 'departure_station', defaultValue: '')
  final String dStation;
  @override
  @JsonKey(name: 'departure_time', defaultValue: '')
  final String dTime;

  @override
  String toString() {
    return 'StationsItemModel(aStation: $aStation, aTime: $aTime, dStation: $dStation, dTime: $dTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StationsItemModel &&
            (identical(other.aStation, aStation) ||
                other.aStation == aStation) &&
            (identical(other.aTime, aTime) || other.aTime == aTime) &&
            (identical(other.dStation, dStation) ||
                other.dStation == dStation) &&
            (identical(other.dTime, dTime) || other.dTime == dTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, aStation, aTime, dStation, dTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StationsItemModelCopyWith<_$_StationsItemModel> get copyWith =>
      __$$_StationsItemModelCopyWithImpl<_$_StationsItemModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StationsItemModelToJson(
      this,
    );
  }
}

abstract class _StationsItemModel implements StationsItemModel {
  const factory _StationsItemModel(
      {@JsonKey(name: 'arrival_station', defaultValue: '')
          required final String aStation,
      @JsonKey(name: 'arrival_time', defaultValue: '')
          required final String aTime,
      @JsonKey(name: 'departure_station', defaultValue: '')
          required final String dStation,
      @JsonKey(name: 'departure_time', defaultValue: '')
          required final String dTime}) = _$_StationsItemModel;

  factory _StationsItemModel.fromJson(Map<String, dynamic> json) =
      _$_StationsItemModel.fromJson;

  @override
  @JsonKey(name: 'arrival_station', defaultValue: '')
  String get aStation;
  @override
  @JsonKey(name: 'arrival_time', defaultValue: '')
  String get aTime;
  @override
  @JsonKey(name: 'departure_station', defaultValue: '')
  String get dStation;
  @override
  @JsonKey(name: 'departure_time', defaultValue: '')
  String get dTime;
  @override
  @JsonKey(ignore: true)
  _$$_StationsItemModelCopyWith<_$_StationsItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
