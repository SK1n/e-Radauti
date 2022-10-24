import 'package:flutterapperadauti/data/models/e_radauti_website/filters_model.dart';
import 'package:flutterapperadauti/data/models/e_radauti_website/records_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'posts_model.g.dart';

@JsonSerializable()
class PostsModel {
  @JsonKey(name: 'prevPageUrl')
  final String? prev;
  @JsonKey(name: 'nextPageUrl')
  final String? next;
  @JsonKey(name: 'totalCount')
  final num? totalCount;
  @JsonKey(name: 'pageCount')
  final num? pageCount;
  @JsonKey(name: 'filters')
  final FiltersModel? filters;
  @JsonKey(name: 'records')
  final List<RecordsModel>? records;

  const PostsModel(this.prev, this.next, this.totalCount, this.pageCount,
      this.filters, this.records);

  factory PostsModel.fromJson(Map<String, dynamic> json) =>
      _$PostsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostsModelToJson(this);
}
