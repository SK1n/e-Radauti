import 'package:json_annotation/json_annotation.dart';

part 'records_model.g.dart';

@JsonSerializable()
class RecordsModel {
  @JsonKey(name: 'id')
  final num? id;
  @JsonKey(name: 'cat_id')
  final num? catId;
  @JsonKey(name: 'user_id')
  final num? userId;
  @JsonKey(name: 'status')
  final num? status;
  @JsonKey(name: 'price')
  final num? price;
  @JsonKey(name: 'featured')
  final num? featured;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'slug')
  final String? slug;
  @JsonKey(name: 'raw_content')
  final String? rawContent;
  @JsonKey(name: 'currency')
  final String? currency;
  @JsonKey(name: 'date_created')
  final String? dateCreated;
  @JsonKey(name: 'date_expires')
  final String? dateExpires;
  @JsonKey(name: 'date_modified')
  final String? dateModified;

  const RecordsModel(
      this.id,
      this.catId,
      this.userId,
      this.status,
      this.price,
      this.featured,
      this.title,
      this.slug,
      this.rawContent,
      this.currency,
      this.dateCreated,
      this.dateExpires,
      this.dateModified);

  factory RecordsModel.fromJson(Map<String, dynamic> json) =>
      _$RecordsModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecordsModelToJson(this);
}
