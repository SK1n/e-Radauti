class JobModel {
  final String title;
  final int id;
  final String rawContent;
  final String content;
  final int price;
  final String currency;
  final String dateExpires;
  final String slug;

  JobModel(this.title, this.id, this.rawContent, this.content, this.price,
      this.currency, this.dateExpires, this.slug);

  JobModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        id = json['id'],
        rawContent = json['raw_content'],
        content = json['content'],
        price = json['price'],
        currency = json['currency'],
        dateExpires = json['date_expires'],
        slug = json['slug'];
}
