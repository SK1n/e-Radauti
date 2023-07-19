// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_announcements_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocalAnnouncementsModel _$LocalAnnouncementsModelFromJson(
    Map<String, dynamic> json) {
  return _LocalAnnouncementsModel.fromJson(json);
}

/// @nodoc
mixin _$LocalAnnouncementsModel {
  @JsonKey(name: 'announcements', defaultValue: [])
  List<LocalAnnouncementsItemModel> get items =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalAnnouncementsModelCopyWith<LocalAnnouncementsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalAnnouncementsModelCopyWith<$Res> {
  factory $LocalAnnouncementsModelCopyWith(LocalAnnouncementsModel value,
          $Res Function(LocalAnnouncementsModel) then) =
      _$LocalAnnouncementsModelCopyWithImpl<$Res, LocalAnnouncementsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'announcements', defaultValue: [])
          List<LocalAnnouncementsItemModel> items});
}

/// @nodoc
class _$LocalAnnouncementsModelCopyWithImpl<$Res,
        $Val extends LocalAnnouncementsModel>
    implements $LocalAnnouncementsModelCopyWith<$Res> {
  _$LocalAnnouncementsModelCopyWithImpl(this._value, this._then);

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
              as List<LocalAnnouncementsItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocalAnnouncementsModelCopyWith<$Res>
    implements $LocalAnnouncementsModelCopyWith<$Res> {
  factory _$$_LocalAnnouncementsModelCopyWith(_$_LocalAnnouncementsModel value,
          $Res Function(_$_LocalAnnouncementsModel) then) =
      __$$_LocalAnnouncementsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'announcements', defaultValue: [])
          List<LocalAnnouncementsItemModel> items});
}

/// @nodoc
class __$$_LocalAnnouncementsModelCopyWithImpl<$Res>
    extends _$LocalAnnouncementsModelCopyWithImpl<$Res,
        _$_LocalAnnouncementsModel>
    implements _$$_LocalAnnouncementsModelCopyWith<$Res> {
  __$$_LocalAnnouncementsModelCopyWithImpl(_$_LocalAnnouncementsModel _value,
      $Res Function(_$_LocalAnnouncementsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$_LocalAnnouncementsModel(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<LocalAnnouncementsItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LocalAnnouncementsModel implements _LocalAnnouncementsModel {
  const _$_LocalAnnouncementsModel(
      {@JsonKey(name: 'announcements', defaultValue: [])
          required final List<LocalAnnouncementsItemModel> items})
      : _items = items;

  factory _$_LocalAnnouncementsModel.fromJson(Map<String, dynamic> json) =>
      _$$_LocalAnnouncementsModelFromJson(json);

  final List<LocalAnnouncementsItemModel> _items;
  @override
  @JsonKey(name: 'announcements', defaultValue: [])
  List<LocalAnnouncementsItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'LocalAnnouncementsModel(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocalAnnouncementsModel &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocalAnnouncementsModelCopyWith<_$_LocalAnnouncementsModel>
      get copyWith =>
          __$$_LocalAnnouncementsModelCopyWithImpl<_$_LocalAnnouncementsModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocalAnnouncementsModelToJson(
      this,
    );
  }
}

abstract class _LocalAnnouncementsModel implements LocalAnnouncementsModel {
  const factory _LocalAnnouncementsModel(
          {@JsonKey(name: 'announcements', defaultValue: [])
              required final List<LocalAnnouncementsItemModel> items}) =
      _$_LocalAnnouncementsModel;

  factory _LocalAnnouncementsModel.fromJson(Map<String, dynamic> json) =
      _$_LocalAnnouncementsModel.fromJson;

  @override
  @JsonKey(name: 'announcements', defaultValue: [])
  List<LocalAnnouncementsItemModel> get items;
  @override
  @JsonKey(ignore: true)
  _$$_LocalAnnouncementsModelCopyWith<_$_LocalAnnouncementsModel>
      get copyWith => throw _privateConstructorUsedError;
}

LocalAnnouncementsItemModel _$LocalAnnouncementsItemModelFromJson(
    Map<String, dynamic> json) {
  return _LocalAnnouncementsItemModel.fromJson(json);
}

/// @nodoc
mixin _$LocalAnnouncementsItemModel {
  @JsonKey(name: 'title', defaultValue: '')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'url', defaultValue: '')
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'description', defaultValue: '')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_created', defaultValue: 0)
  int get dateCreated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalAnnouncementsItemModelCopyWith<LocalAnnouncementsItemModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalAnnouncementsItemModelCopyWith<$Res> {
  factory $LocalAnnouncementsItemModelCopyWith(
          LocalAnnouncementsItemModel value,
          $Res Function(LocalAnnouncementsItemModel) then) =
      _$LocalAnnouncementsItemModelCopyWithImpl<$Res,
          LocalAnnouncementsItemModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'title', defaultValue: '') String title,
      @JsonKey(name: 'url', defaultValue: '') String image,
      @JsonKey(name: 'description', defaultValue: '') String description,
      @JsonKey(name: 'date_created', defaultValue: 0) int dateCreated});
}

/// @nodoc
class _$LocalAnnouncementsItemModelCopyWithImpl<$Res,
        $Val extends LocalAnnouncementsItemModel>
    implements $LocalAnnouncementsItemModelCopyWith<$Res> {
  _$LocalAnnouncementsItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? image = null,
    Object? description = null,
    Object? dateCreated = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dateCreated: null == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocalAnnouncementsItemModelCopyWith<$Res>
    implements $LocalAnnouncementsItemModelCopyWith<$Res> {
  factory _$$_LocalAnnouncementsItemModelCopyWith(
          _$_LocalAnnouncementsItemModel value,
          $Res Function(_$_LocalAnnouncementsItemModel) then) =
      __$$_LocalAnnouncementsItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'title', defaultValue: '') String title,
      @JsonKey(name: 'url', defaultValue: '') String image,
      @JsonKey(name: 'description', defaultValue: '') String description,
      @JsonKey(name: 'date_created', defaultValue: 0) int dateCreated});
}

/// @nodoc
class __$$_LocalAnnouncementsItemModelCopyWithImpl<$Res>
    extends _$LocalAnnouncementsItemModelCopyWithImpl<$Res,
        _$_LocalAnnouncementsItemModel>
    implements _$$_LocalAnnouncementsItemModelCopyWith<$Res> {
  __$$_LocalAnnouncementsItemModelCopyWithImpl(
      _$_LocalAnnouncementsItemModel _value,
      $Res Function(_$_LocalAnnouncementsItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? image = null,
    Object? description = null,
    Object? dateCreated = null,
  }) {
    return _then(_$_LocalAnnouncementsItemModel(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dateCreated: null == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LocalAnnouncementsItemModel implements _LocalAnnouncementsItemModel {
  const _$_LocalAnnouncementsItemModel(
      {@JsonKey(name: 'title', defaultValue: '')
          required this.title,
      @JsonKey(name: 'url', defaultValue: '')
          required this.image,
      @JsonKey(name: 'description', defaultValue: '')
          required this.description,
      @JsonKey(name: 'date_created', defaultValue: 0)
          required this.dateCreated});

  factory _$_LocalAnnouncementsItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_LocalAnnouncementsItemModelFromJson(json);

  @override
  @JsonKey(name: 'title', defaultValue: '')
  final String title;
  @override
  @JsonKey(name: 'url', defaultValue: '')
  final String image;
  @override
  @JsonKey(name: 'description', defaultValue: '')
  final String description;
  @override
  @JsonKey(name: 'date_created', defaultValue: 0)
  final int dateCreated;

  @override
  String toString() {
    return 'LocalAnnouncementsItemModel(title: $title, image: $image, description: $description, dateCreated: $dateCreated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocalAnnouncementsItemModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dateCreated, dateCreated) ||
                other.dateCreated == dateCreated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, image, description, dateCreated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocalAnnouncementsItemModelCopyWith<_$_LocalAnnouncementsItemModel>
      get copyWith => __$$_LocalAnnouncementsItemModelCopyWithImpl<
          _$_LocalAnnouncementsItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocalAnnouncementsItemModelToJson(
      this,
    );
  }
}

abstract class _LocalAnnouncementsItemModel
    implements LocalAnnouncementsItemModel {
  const factory _LocalAnnouncementsItemModel(
      {@JsonKey(name: 'title', defaultValue: '')
          required final String title,
      @JsonKey(name: 'url', defaultValue: '')
          required final String image,
      @JsonKey(name: 'description', defaultValue: '')
          required final String description,
      @JsonKey(name: 'date_created', defaultValue: 0)
          required final int dateCreated}) = _$_LocalAnnouncementsItemModel;

  factory _LocalAnnouncementsItemModel.fromJson(Map<String, dynamic> json) =
      _$_LocalAnnouncementsItemModel.fromJson;

  @override
  @JsonKey(name: 'title', defaultValue: '')
  String get title;
  @override
  @JsonKey(name: 'url', defaultValue: '')
  String get image;
  @override
  @JsonKey(name: 'description', defaultValue: '')
  String get description;
  @override
  @JsonKey(name: 'date_created', defaultValue: 0)
  int get dateCreated;
  @override
  @JsonKey(ignore: true)
  _$$_LocalAnnouncementsItemModelCopyWith<_$_LocalAnnouncementsItemModel>
      get copyWith => throw _privateConstructorUsedError;
}
