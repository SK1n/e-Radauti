// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'e_radauti_website_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ERadautiWebsiteModel _$ERadautiWebsiteModelFromJson(Map<String, dynamic> json) {
  return _ERadautiWebsiteModel.fromJson(json);
}

/// @nodoc
mixin _$ERadautiWebsiteModel {
  @JsonKey(name: 'context')
  ERadautiWebsiteContextModel get context => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ERadautiWebsiteModelCopyWith<ERadautiWebsiteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ERadautiWebsiteModelCopyWith<$Res> {
  factory $ERadautiWebsiteModelCopyWith(ERadautiWebsiteModel value,
          $Res Function(ERadautiWebsiteModel) then) =
      _$ERadautiWebsiteModelCopyWithImpl<$Res, ERadautiWebsiteModel>;
  @useResult
  $Res call({@JsonKey(name: 'context') ERadautiWebsiteContextModel context});

  $ERadautiWebsiteContextModelCopyWith<$Res> get context;
}

/// @nodoc
class _$ERadautiWebsiteModelCopyWithImpl<$Res,
        $Val extends ERadautiWebsiteModel>
    implements $ERadautiWebsiteModelCopyWith<$Res> {
  _$ERadautiWebsiteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
  }) {
    return _then(_value.copyWith(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as ERadautiWebsiteContextModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ERadautiWebsiteContextModelCopyWith<$Res> get context {
    return $ERadautiWebsiteContextModelCopyWith<$Res>(_value.context, (value) {
      return _then(_value.copyWith(context: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ERadautiWebsiteModelCopyWith<$Res>
    implements $ERadautiWebsiteModelCopyWith<$Res> {
  factory _$$_ERadautiWebsiteModelCopyWith(_$_ERadautiWebsiteModel value,
          $Res Function(_$_ERadautiWebsiteModel) then) =
      __$$_ERadautiWebsiteModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'context') ERadautiWebsiteContextModel context});

  @override
  $ERadautiWebsiteContextModelCopyWith<$Res> get context;
}

/// @nodoc
class __$$_ERadautiWebsiteModelCopyWithImpl<$Res>
    extends _$ERadautiWebsiteModelCopyWithImpl<$Res, _$_ERadautiWebsiteModel>
    implements _$$_ERadautiWebsiteModelCopyWith<$Res> {
  __$$_ERadautiWebsiteModelCopyWithImpl(_$_ERadautiWebsiteModel _value,
      $Res Function(_$_ERadautiWebsiteModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
  }) {
    return _then(_$_ERadautiWebsiteModel(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as ERadautiWebsiteContextModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ERadautiWebsiteModel implements _ERadautiWebsiteModel {
  const _$_ERadautiWebsiteModel(
      {@JsonKey(name: 'context') required this.context});

  factory _$_ERadautiWebsiteModel.fromJson(Map<String, dynamic> json) =>
      _$$_ERadautiWebsiteModelFromJson(json);

  @override
  @JsonKey(name: 'context')
  final ERadautiWebsiteContextModel context;

  @override
  String toString() {
    return 'ERadautiWebsiteModel(context: $context)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ERadautiWebsiteModel &&
            (identical(other.context, context) || other.context == context));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ERadautiWebsiteModelCopyWith<_$_ERadautiWebsiteModel> get copyWith =>
      __$$_ERadautiWebsiteModelCopyWithImpl<_$_ERadautiWebsiteModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ERadautiWebsiteModelToJson(
      this,
    );
  }
}

abstract class _ERadautiWebsiteModel implements ERadautiWebsiteModel {
  const factory _ERadautiWebsiteModel(
          {@JsonKey(name: 'context')
              required final ERadautiWebsiteContextModel context}) =
      _$_ERadautiWebsiteModel;

  factory _ERadautiWebsiteModel.fromJson(Map<String, dynamic> json) =
      _$_ERadautiWebsiteModel.fromJson;

  @override
  @JsonKey(name: 'context')
  ERadautiWebsiteContextModel get context;
  @override
  @JsonKey(ignore: true)
  _$$_ERadautiWebsiteModelCopyWith<_$_ERadautiWebsiteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ERadautiWebsiteContextModel _$ERadautiWebsiteContextModelFromJson(
    Map<String, dynamic> json) {
  return _ERadautiWebsiteContextModel.fromJson(json);
}

/// @nodoc
mixin _$ERadautiWebsiteContextModel {
  @JsonKey(name: 'posts')
  ERadautiWebsitePostsModel get posts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ERadautiWebsiteContextModelCopyWith<ERadautiWebsiteContextModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ERadautiWebsiteContextModelCopyWith<$Res> {
  factory $ERadautiWebsiteContextModelCopyWith(
          ERadautiWebsiteContextModel value,
          $Res Function(ERadautiWebsiteContextModel) then) =
      _$ERadautiWebsiteContextModelCopyWithImpl<$Res,
          ERadautiWebsiteContextModel>;
  @useResult
  $Res call({@JsonKey(name: 'posts') ERadautiWebsitePostsModel posts});

  $ERadautiWebsitePostsModelCopyWith<$Res> get posts;
}

/// @nodoc
class _$ERadautiWebsiteContextModelCopyWithImpl<$Res,
        $Val extends ERadautiWebsiteContextModel>
    implements $ERadautiWebsiteContextModelCopyWith<$Res> {
  _$ERadautiWebsiteContextModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
  }) {
    return _then(_value.copyWith(
      posts: null == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as ERadautiWebsitePostsModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ERadautiWebsitePostsModelCopyWith<$Res> get posts {
    return $ERadautiWebsitePostsModelCopyWith<$Res>(_value.posts, (value) {
      return _then(_value.copyWith(posts: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ERadautiWebsiteContextModelCopyWith<$Res>
    implements $ERadautiWebsiteContextModelCopyWith<$Res> {
  factory _$$_ERadautiWebsiteContextModelCopyWith(
          _$_ERadautiWebsiteContextModel value,
          $Res Function(_$_ERadautiWebsiteContextModel) then) =
      __$$_ERadautiWebsiteContextModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'posts') ERadautiWebsitePostsModel posts});

  @override
  $ERadautiWebsitePostsModelCopyWith<$Res> get posts;
}

/// @nodoc
class __$$_ERadautiWebsiteContextModelCopyWithImpl<$Res>
    extends _$ERadautiWebsiteContextModelCopyWithImpl<$Res,
        _$_ERadautiWebsiteContextModel>
    implements _$$_ERadautiWebsiteContextModelCopyWith<$Res> {
  __$$_ERadautiWebsiteContextModelCopyWithImpl(
      _$_ERadautiWebsiteContextModel _value,
      $Res Function(_$_ERadautiWebsiteContextModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
  }) {
    return _then(_$_ERadautiWebsiteContextModel(
      posts: null == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as ERadautiWebsitePostsModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ERadautiWebsiteContextModel implements _ERadautiWebsiteContextModel {
  const _$_ERadautiWebsiteContextModel(
      {@JsonKey(name: 'posts') required this.posts});

  factory _$_ERadautiWebsiteContextModel.fromJson(Map<String, dynamic> json) =>
      _$$_ERadautiWebsiteContextModelFromJson(json);

  @override
  @JsonKey(name: 'posts')
  final ERadautiWebsitePostsModel posts;

  @override
  String toString() {
    return 'ERadautiWebsiteContextModel(posts: $posts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ERadautiWebsiteContextModel &&
            (identical(other.posts, posts) || other.posts == posts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, posts);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ERadautiWebsiteContextModelCopyWith<_$_ERadautiWebsiteContextModel>
      get copyWith => __$$_ERadautiWebsiteContextModelCopyWithImpl<
          _$_ERadautiWebsiteContextModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ERadautiWebsiteContextModelToJson(
      this,
    );
  }
}

abstract class _ERadautiWebsiteContextModel
    implements ERadautiWebsiteContextModel {
  const factory _ERadautiWebsiteContextModel(
          {@JsonKey(name: 'posts')
              required final ERadautiWebsitePostsModel posts}) =
      _$_ERadautiWebsiteContextModel;

  factory _ERadautiWebsiteContextModel.fromJson(Map<String, dynamic> json) =
      _$_ERadautiWebsiteContextModel.fromJson;

  @override
  @JsonKey(name: 'posts')
  ERadautiWebsitePostsModel get posts;
  @override
  @JsonKey(ignore: true)
  _$$_ERadautiWebsiteContextModelCopyWith<_$_ERadautiWebsiteContextModel>
      get copyWith => throw _privateConstructorUsedError;
}

ERadautiWebsitePostsModel _$ERadautiWebsitePostsModelFromJson(
    Map<String, dynamic> json) {
  return _ERadautiWebsitePostsModel.fromJson(json);
}

/// @nodoc
mixin _$ERadautiWebsitePostsModel {
  @JsonKey(name: 'records')
  List<ERadautiWebsiteRecordsModel> get records =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ERadautiWebsitePostsModelCopyWith<ERadautiWebsitePostsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ERadautiWebsitePostsModelCopyWith<$Res> {
  factory $ERadautiWebsitePostsModelCopyWith(ERadautiWebsitePostsModel value,
          $Res Function(ERadautiWebsitePostsModel) then) =
      _$ERadautiWebsitePostsModelCopyWithImpl<$Res, ERadautiWebsitePostsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'records') List<ERadautiWebsiteRecordsModel> records});
}

/// @nodoc
class _$ERadautiWebsitePostsModelCopyWithImpl<$Res,
        $Val extends ERadautiWebsitePostsModel>
    implements $ERadautiWebsitePostsModelCopyWith<$Res> {
  _$ERadautiWebsitePostsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? records = null,
  }) {
    return _then(_value.copyWith(
      records: null == records
          ? _value.records
          : records // ignore: cast_nullable_to_non_nullable
              as List<ERadautiWebsiteRecordsModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ERadautiWebsitePostsModelCopyWith<$Res>
    implements $ERadautiWebsitePostsModelCopyWith<$Res> {
  factory _$$_ERadautiWebsitePostsModelCopyWith(
          _$_ERadautiWebsitePostsModel value,
          $Res Function(_$_ERadautiWebsitePostsModel) then) =
      __$$_ERadautiWebsitePostsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'records') List<ERadautiWebsiteRecordsModel> records});
}

/// @nodoc
class __$$_ERadautiWebsitePostsModelCopyWithImpl<$Res>
    extends _$ERadautiWebsitePostsModelCopyWithImpl<$Res,
        _$_ERadautiWebsitePostsModel>
    implements _$$_ERadautiWebsitePostsModelCopyWith<$Res> {
  __$$_ERadautiWebsitePostsModelCopyWithImpl(
      _$_ERadautiWebsitePostsModel _value,
      $Res Function(_$_ERadautiWebsitePostsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? records = null,
  }) {
    return _then(_$_ERadautiWebsitePostsModel(
      records: null == records
          ? _value._records
          : records // ignore: cast_nullable_to_non_nullable
              as List<ERadautiWebsiteRecordsModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ERadautiWebsitePostsModel implements _ERadautiWebsitePostsModel {
  const _$_ERadautiWebsitePostsModel(
      {@JsonKey(name: 'records')
          required final List<ERadautiWebsiteRecordsModel> records})
      : _records = records;

  factory _$_ERadautiWebsitePostsModel.fromJson(Map<String, dynamic> json) =>
      _$$_ERadautiWebsitePostsModelFromJson(json);

  final List<ERadautiWebsiteRecordsModel> _records;
  @override
  @JsonKey(name: 'records')
  List<ERadautiWebsiteRecordsModel> get records {
    if (_records is EqualUnmodifiableListView) return _records;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_records);
  }

  @override
  String toString() {
    return 'ERadautiWebsitePostsModel(records: $records)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ERadautiWebsitePostsModel &&
            const DeepCollectionEquality().equals(other._records, _records));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_records));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ERadautiWebsitePostsModelCopyWith<_$_ERadautiWebsitePostsModel>
      get copyWith => __$$_ERadautiWebsitePostsModelCopyWithImpl<
          _$_ERadautiWebsitePostsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ERadautiWebsitePostsModelToJson(
      this,
    );
  }
}

abstract class _ERadautiWebsitePostsModel implements ERadautiWebsitePostsModel {
  const factory _ERadautiWebsitePostsModel(
          {@JsonKey(name: 'records')
              required final List<ERadautiWebsiteRecordsModel> records}) =
      _$_ERadautiWebsitePostsModel;

  factory _ERadautiWebsitePostsModel.fromJson(Map<String, dynamic> json) =
      _$_ERadautiWebsitePostsModel.fromJson;

  @override
  @JsonKey(name: 'records')
  List<ERadautiWebsiteRecordsModel> get records;
  @override
  @JsonKey(ignore: true)
  _$$_ERadautiWebsitePostsModelCopyWith<_$_ERadautiWebsitePostsModel>
      get copyWith => throw _privateConstructorUsedError;
}

ERadautiWebsiteRecordsModel _$ERadautiWebsiteRecordsModelFromJson(
    Map<String, dynamic> json) {
  return _ERadautiWebsiteRecordsModel.fromJson(json);
}

/// @nodoc
mixin _$ERadautiWebsiteRecordsModel {
  @JsonKey(name: 'id', defaultValue: 0)
  num get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'cat_id', defaultValue: 0)
  num get catId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id', defaultValue: 0)
  num get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'status', defaultValue: 0)
  num get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'price', defaultValue: 0)
  num get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'featured', defaultValue: 0)
  num get featured => throw _privateConstructorUsedError;
  @JsonKey(name: 'title', defaultValue: '')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'slug', defaultValue: '')
  String get slug => throw _privateConstructorUsedError;
  @JsonKey(name: 'raw_content', defaultValue: '')
  String get rawContent => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency', defaultValue: '')
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_created', defaultValue: '')
  String get dateCreated => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_expires', defaultValue: '')
  String get dateExpires => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_modified', defaultValue: '')
  String get dateModified => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ERadautiWebsiteRecordsModelCopyWith<ERadautiWebsiteRecordsModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ERadautiWebsiteRecordsModelCopyWith<$Res> {
  factory $ERadautiWebsiteRecordsModelCopyWith(
          ERadautiWebsiteRecordsModel value,
          $Res Function(ERadautiWebsiteRecordsModel) then) =
      _$ERadautiWebsiteRecordsModelCopyWithImpl<$Res,
          ERadautiWebsiteRecordsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: 0) num id,
      @JsonKey(name: 'cat_id', defaultValue: 0) num catId,
      @JsonKey(name: 'user_id', defaultValue: 0) num userId,
      @JsonKey(name: 'status', defaultValue: 0) num status,
      @JsonKey(name: 'price', defaultValue: 0) num price,
      @JsonKey(name: 'featured', defaultValue: 0) num featured,
      @JsonKey(name: 'title', defaultValue: '') String title,
      @JsonKey(name: 'slug', defaultValue: '') String slug,
      @JsonKey(name: 'raw_content', defaultValue: '') String rawContent,
      @JsonKey(name: 'currency', defaultValue: '') String currency,
      @JsonKey(name: 'date_created', defaultValue: '') String dateCreated,
      @JsonKey(name: 'date_expires', defaultValue: '') String dateExpires,
      @JsonKey(name: 'date_modified', defaultValue: '') String dateModified});
}

/// @nodoc
class _$ERadautiWebsiteRecordsModelCopyWithImpl<$Res,
        $Val extends ERadautiWebsiteRecordsModel>
    implements $ERadautiWebsiteRecordsModelCopyWith<$Res> {
  _$ERadautiWebsiteRecordsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? catId = null,
    Object? userId = null,
    Object? status = null,
    Object? price = null,
    Object? featured = null,
    Object? title = null,
    Object? slug = null,
    Object? rawContent = null,
    Object? currency = null,
    Object? dateCreated = null,
    Object? dateExpires = null,
    Object? dateModified = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num,
      catId: null == catId
          ? _value.catId
          : catId // ignore: cast_nullable_to_non_nullable
              as num,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as num,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as num,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num,
      featured: null == featured
          ? _value.featured
          : featured // ignore: cast_nullable_to_non_nullable
              as num,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      rawContent: null == rawContent
          ? _value.rawContent
          : rawContent // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      dateCreated: null == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as String,
      dateExpires: null == dateExpires
          ? _value.dateExpires
          : dateExpires // ignore: cast_nullable_to_non_nullable
              as String,
      dateModified: null == dateModified
          ? _value.dateModified
          : dateModified // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ERadautiWebsiteRecordsModelCopyWith<$Res>
    implements $ERadautiWebsiteRecordsModelCopyWith<$Res> {
  factory _$$_ERadautiWebsiteRecordsModelCopyWith(
          _$_ERadautiWebsiteRecordsModel value,
          $Res Function(_$_ERadautiWebsiteRecordsModel) then) =
      __$$_ERadautiWebsiteRecordsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: 0) num id,
      @JsonKey(name: 'cat_id', defaultValue: 0) num catId,
      @JsonKey(name: 'user_id', defaultValue: 0) num userId,
      @JsonKey(name: 'status', defaultValue: 0) num status,
      @JsonKey(name: 'price', defaultValue: 0) num price,
      @JsonKey(name: 'featured', defaultValue: 0) num featured,
      @JsonKey(name: 'title', defaultValue: '') String title,
      @JsonKey(name: 'slug', defaultValue: '') String slug,
      @JsonKey(name: 'raw_content', defaultValue: '') String rawContent,
      @JsonKey(name: 'currency', defaultValue: '') String currency,
      @JsonKey(name: 'date_created', defaultValue: '') String dateCreated,
      @JsonKey(name: 'date_expires', defaultValue: '') String dateExpires,
      @JsonKey(name: 'date_modified', defaultValue: '') String dateModified});
}

/// @nodoc
class __$$_ERadautiWebsiteRecordsModelCopyWithImpl<$Res>
    extends _$ERadautiWebsiteRecordsModelCopyWithImpl<$Res,
        _$_ERadautiWebsiteRecordsModel>
    implements _$$_ERadautiWebsiteRecordsModelCopyWith<$Res> {
  __$$_ERadautiWebsiteRecordsModelCopyWithImpl(
      _$_ERadautiWebsiteRecordsModel _value,
      $Res Function(_$_ERadautiWebsiteRecordsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? catId = null,
    Object? userId = null,
    Object? status = null,
    Object? price = null,
    Object? featured = null,
    Object? title = null,
    Object? slug = null,
    Object? rawContent = null,
    Object? currency = null,
    Object? dateCreated = null,
    Object? dateExpires = null,
    Object? dateModified = null,
  }) {
    return _then(_$_ERadautiWebsiteRecordsModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num,
      catId: null == catId
          ? _value.catId
          : catId // ignore: cast_nullable_to_non_nullable
              as num,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as num,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as num,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num,
      featured: null == featured
          ? _value.featured
          : featured // ignore: cast_nullable_to_non_nullable
              as num,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      rawContent: null == rawContent
          ? _value.rawContent
          : rawContent // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      dateCreated: null == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as String,
      dateExpires: null == dateExpires
          ? _value.dateExpires
          : dateExpires // ignore: cast_nullable_to_non_nullable
              as String,
      dateModified: null == dateModified
          ? _value.dateModified
          : dateModified // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ERadautiWebsiteRecordsModel implements _ERadautiWebsiteRecordsModel {
  const _$_ERadautiWebsiteRecordsModel(
      {@JsonKey(name: 'id', defaultValue: 0)
          required this.id,
      @JsonKey(name: 'cat_id', defaultValue: 0)
          required this.catId,
      @JsonKey(name: 'user_id', defaultValue: 0)
          required this.userId,
      @JsonKey(name: 'status', defaultValue: 0)
          required this.status,
      @JsonKey(name: 'price', defaultValue: 0)
          required this.price,
      @JsonKey(name: 'featured', defaultValue: 0)
          required this.featured,
      @JsonKey(name: 'title', defaultValue: '')
          required this.title,
      @JsonKey(name: 'slug', defaultValue: '')
          required this.slug,
      @JsonKey(name: 'raw_content', defaultValue: '')
          required this.rawContent,
      @JsonKey(name: 'currency', defaultValue: '')
          required this.currency,
      @JsonKey(name: 'date_created', defaultValue: '')
          required this.dateCreated,
      @JsonKey(name: 'date_expires', defaultValue: '')
          required this.dateExpires,
      @JsonKey(name: 'date_modified', defaultValue: '')
          required this.dateModified});

  factory _$_ERadautiWebsiteRecordsModel.fromJson(Map<String, dynamic> json) =>
      _$$_ERadautiWebsiteRecordsModelFromJson(json);

  @override
  @JsonKey(name: 'id', defaultValue: 0)
  final num id;
  @override
  @JsonKey(name: 'cat_id', defaultValue: 0)
  final num catId;
  @override
  @JsonKey(name: 'user_id', defaultValue: 0)
  final num userId;
  @override
  @JsonKey(name: 'status', defaultValue: 0)
  final num status;
  @override
  @JsonKey(name: 'price', defaultValue: 0)
  final num price;
  @override
  @JsonKey(name: 'featured', defaultValue: 0)
  final num featured;
  @override
  @JsonKey(name: 'title', defaultValue: '')
  final String title;
  @override
  @JsonKey(name: 'slug', defaultValue: '')
  final String slug;
  @override
  @JsonKey(name: 'raw_content', defaultValue: '')
  final String rawContent;
  @override
  @JsonKey(name: 'currency', defaultValue: '')
  final String currency;
  @override
  @JsonKey(name: 'date_created', defaultValue: '')
  final String dateCreated;
  @override
  @JsonKey(name: 'date_expires', defaultValue: '')
  final String dateExpires;
  @override
  @JsonKey(name: 'date_modified', defaultValue: '')
  final String dateModified;

  @override
  String toString() {
    return 'ERadautiWebsiteRecordsModel(id: $id, catId: $catId, userId: $userId, status: $status, price: $price, featured: $featured, title: $title, slug: $slug, rawContent: $rawContent, currency: $currency, dateCreated: $dateCreated, dateExpires: $dateExpires, dateModified: $dateModified)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ERadautiWebsiteRecordsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.catId, catId) || other.catId == catId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.featured, featured) ||
                other.featured == featured) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.rawContent, rawContent) ||
                other.rawContent == rawContent) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.dateCreated, dateCreated) ||
                other.dateCreated == dateCreated) &&
            (identical(other.dateExpires, dateExpires) ||
                other.dateExpires == dateExpires) &&
            (identical(other.dateModified, dateModified) ||
                other.dateModified == dateModified));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      catId,
      userId,
      status,
      price,
      featured,
      title,
      slug,
      rawContent,
      currency,
      dateCreated,
      dateExpires,
      dateModified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ERadautiWebsiteRecordsModelCopyWith<_$_ERadautiWebsiteRecordsModel>
      get copyWith => __$$_ERadautiWebsiteRecordsModelCopyWithImpl<
          _$_ERadautiWebsiteRecordsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ERadautiWebsiteRecordsModelToJson(
      this,
    );
  }
}

abstract class _ERadautiWebsiteRecordsModel
    implements ERadautiWebsiteRecordsModel {
  const factory _ERadautiWebsiteRecordsModel(
      {@JsonKey(name: 'id', defaultValue: 0)
          required final num id,
      @JsonKey(name: 'cat_id', defaultValue: 0)
          required final num catId,
      @JsonKey(name: 'user_id', defaultValue: 0)
          required final num userId,
      @JsonKey(name: 'status', defaultValue: 0)
          required final num status,
      @JsonKey(name: 'price', defaultValue: 0)
          required final num price,
      @JsonKey(name: 'featured', defaultValue: 0)
          required final num featured,
      @JsonKey(name: 'title', defaultValue: '')
          required final String title,
      @JsonKey(name: 'slug', defaultValue: '')
          required final String slug,
      @JsonKey(name: 'raw_content', defaultValue: '')
          required final String rawContent,
      @JsonKey(name: 'currency', defaultValue: '')
          required final String currency,
      @JsonKey(name: 'date_created', defaultValue: '')
          required final String dateCreated,
      @JsonKey(name: 'date_expires', defaultValue: '')
          required final String dateExpires,
      @JsonKey(name: 'date_modified', defaultValue: '')
          required final String dateModified}) = _$_ERadautiWebsiteRecordsModel;

  factory _ERadautiWebsiteRecordsModel.fromJson(Map<String, dynamic> json) =
      _$_ERadautiWebsiteRecordsModel.fromJson;

  @override
  @JsonKey(name: 'id', defaultValue: 0)
  num get id;
  @override
  @JsonKey(name: 'cat_id', defaultValue: 0)
  num get catId;
  @override
  @JsonKey(name: 'user_id', defaultValue: 0)
  num get userId;
  @override
  @JsonKey(name: 'status', defaultValue: 0)
  num get status;
  @override
  @JsonKey(name: 'price', defaultValue: 0)
  num get price;
  @override
  @JsonKey(name: 'featured', defaultValue: 0)
  num get featured;
  @override
  @JsonKey(name: 'title', defaultValue: '')
  String get title;
  @override
  @JsonKey(name: 'slug', defaultValue: '')
  String get slug;
  @override
  @JsonKey(name: 'raw_content', defaultValue: '')
  String get rawContent;
  @override
  @JsonKey(name: 'currency', defaultValue: '')
  String get currency;
  @override
  @JsonKey(name: 'date_created', defaultValue: '')
  String get dateCreated;
  @override
  @JsonKey(name: 'date_expires', defaultValue: '')
  String get dateExpires;
  @override
  @JsonKey(name: 'date_modified', defaultValue: '')
  String get dateModified;
  @override
  @JsonKey(ignore: true)
  _$$_ERadautiWebsiteRecordsModelCopyWith<_$_ERadautiWebsiteRecordsModel>
      get copyWith => throw _privateConstructorUsedError;
}
