// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventModel _$EventModelFromJson(Map<String, dynamic> json) {
  return _EventModel.fromJson(json);
}

/// @nodoc
mixin _$EventModel {
  @JsonKey(defaultValue: [])
  List<String> get category => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get host => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get location => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int get startTimestamp => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int get endTimestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventModelCopyWith<EventModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventModelCopyWith<$Res> {
  factory $EventModelCopyWith(
          EventModel value, $Res Function(EventModel) then) =
      _$EventModelCopyWithImpl<$Res, EventModel>;
  @useResult
  $Res call(
      {@JsonKey(defaultValue: []) List<String> category,
      @JsonKey(defaultValue: '') String description,
      @JsonKey(defaultValue: '') String host,
      @JsonKey(defaultValue: '') String imageUrl,
      @JsonKey(defaultValue: '') String location,
      @JsonKey(defaultValue: '') String title,
      @JsonKey(defaultValue: 0) int startTimestamp,
      @JsonKey(defaultValue: 0) int endTimestamp});
}

/// @nodoc
class _$EventModelCopyWithImpl<$Res, $Val extends EventModel>
    implements $EventModelCopyWith<$Res> {
  _$EventModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? description = null,
    Object? host = null,
    Object? imageUrl = null,
    Object? location = null,
    Object? title = null,
    Object? startTimestamp = null,
    Object? endTimestamp = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startTimestamp: null == startTimestamp
          ? _value.startTimestamp
          : startTimestamp // ignore: cast_nullable_to_non_nullable
              as int,
      endTimestamp: null == endTimestamp
          ? _value.endTimestamp
          : endTimestamp // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EventModelCopyWith<$Res>
    implements $EventModelCopyWith<$Res> {
  factory _$$_EventModelCopyWith(
          _$_EventModel value, $Res Function(_$_EventModel) then) =
      __$$_EventModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(defaultValue: []) List<String> category,
      @JsonKey(defaultValue: '') String description,
      @JsonKey(defaultValue: '') String host,
      @JsonKey(defaultValue: '') String imageUrl,
      @JsonKey(defaultValue: '') String location,
      @JsonKey(defaultValue: '') String title,
      @JsonKey(defaultValue: 0) int startTimestamp,
      @JsonKey(defaultValue: 0) int endTimestamp});
}

/// @nodoc
class __$$_EventModelCopyWithImpl<$Res>
    extends _$EventModelCopyWithImpl<$Res, _$_EventModel>
    implements _$$_EventModelCopyWith<$Res> {
  __$$_EventModelCopyWithImpl(
      _$_EventModel _value, $Res Function(_$_EventModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? description = null,
    Object? host = null,
    Object? imageUrl = null,
    Object? location = null,
    Object? title = null,
    Object? startTimestamp = null,
    Object? endTimestamp = null,
  }) {
    return _then(_$_EventModel(
      category: null == category
          ? _value._category
          : category // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startTimestamp: null == startTimestamp
          ? _value.startTimestamp
          : startTimestamp // ignore: cast_nullable_to_non_nullable
              as int,
      endTimestamp: null == endTimestamp
          ? _value.endTimestamp
          : endTimestamp // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EventModel implements _EventModel {
  const _$_EventModel(
      {@JsonKey(defaultValue: []) required final List<String> category,
      @JsonKey(defaultValue: '') required this.description,
      @JsonKey(defaultValue: '') required this.host,
      @JsonKey(defaultValue: '') required this.imageUrl,
      @JsonKey(defaultValue: '') required this.location,
      @JsonKey(defaultValue: '') required this.title,
      @JsonKey(defaultValue: 0) required this.startTimestamp,
      @JsonKey(defaultValue: 0) required this.endTimestamp})
      : _category = category;

  factory _$_EventModel.fromJson(Map<String, dynamic> json) =>
      _$$_EventModelFromJson(json);

  final List<String> _category;
  @override
  @JsonKey(defaultValue: [])
  List<String> get category {
    if (_category is EqualUnmodifiableListView) return _category;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_category);
  }

  @override
  @JsonKey(defaultValue: '')
  final String description;
  @override
  @JsonKey(defaultValue: '')
  final String host;
  @override
  @JsonKey(defaultValue: '')
  final String imageUrl;
  @override
  @JsonKey(defaultValue: '')
  final String location;
  @override
  @JsonKey(defaultValue: '')
  final String title;
  @override
  @JsonKey(defaultValue: 0)
  final int startTimestamp;
  @override
  @JsonKey(defaultValue: 0)
  final int endTimestamp;

  @override
  String toString() {
    return 'EventModel(category: $category, description: $description, host: $host, imageUrl: $imageUrl, location: $location, title: $title, startTimestamp: $startTimestamp, endTimestamp: $endTimestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventModel &&
            const DeepCollectionEquality().equals(other._category, _category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.startTimestamp, startTimestamp) ||
                other.startTimestamp == startTimestamp) &&
            (identical(other.endTimestamp, endTimestamp) ||
                other.endTimestamp == endTimestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_category),
      description,
      host,
      imageUrl,
      location,
      title,
      startTimestamp,
      endTimestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventModelCopyWith<_$_EventModel> get copyWith =>
      __$$_EventModelCopyWithImpl<_$_EventModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventModelToJson(
      this,
    );
  }
}

abstract class _EventModel implements EventModel {
  const factory _EventModel(
          {@JsonKey(defaultValue: []) required final List<String> category,
          @JsonKey(defaultValue: '') required final String description,
          @JsonKey(defaultValue: '') required final String host,
          @JsonKey(defaultValue: '') required final String imageUrl,
          @JsonKey(defaultValue: '') required final String location,
          @JsonKey(defaultValue: '') required final String title,
          @JsonKey(defaultValue: 0) required final int startTimestamp,
          @JsonKey(defaultValue: 0) required final int endTimestamp}) =
      _$_EventModel;

  factory _EventModel.fromJson(Map<String, dynamic> json) =
      _$_EventModel.fromJson;

  @override
  @JsonKey(defaultValue: [])
  List<String> get category;
  @override
  @JsonKey(defaultValue: '')
  String get description;
  @override
  @JsonKey(defaultValue: '')
  String get host;
  @override
  @JsonKey(defaultValue: '')
  String get imageUrl;
  @override
  @JsonKey(defaultValue: '')
  String get location;
  @override
  @JsonKey(defaultValue: '')
  String get title;
  @override
  @JsonKey(defaultValue: 0)
  int get startTimestamp;
  @override
  @JsonKey(defaultValue: 0)
  int get endTimestamp;
  @override
  @JsonKey(ignore: true)
  _$$_EventModelCopyWith<_$_EventModel> get copyWith =>
      throw _privateConstructorUsedError;
}
