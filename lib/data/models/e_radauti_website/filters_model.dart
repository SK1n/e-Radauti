import 'package:json_annotation/json_annotation.dart';

part 'filters_model.g.dart';

@JsonSerializable()
class FiltersModel {
  @JsonKey(name: 'pageNumber')
  final num? pageNumber;
  @JsonKey(name: 'sort')
  final String? sort;
  @JsonKey(name: 'catID')
  final String? catId;
  @JsonKey(name: 'userID')
  final String? userId;
  @JsonKey(name: 'onlyDeleted')
  final bool? onlyDeleted;
  @JsonKey(name: 'useCache')
  final bool? useCache;
  @JsonKey(name: 'catSlug')
  final String? catSlug;
  @JsonKey(name: '__routeName')
  final String? routeName;

  const FiltersModel(this.pageNumber, this.sort, this.catId, this.userId,
      this.onlyDeleted, this.useCache, this.catSlug, this.routeName);

  factory FiltersModel.fromJson(Map<String, dynamic> json) =>
      _$FiltersModelFromJson(json);

  Map<String, dynamic> toJson() => _$FiltersModelToJson(this);
}
