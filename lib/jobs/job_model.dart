class JobModel {
  final String title;
  final int id;
  final String rawContent;
  final String content;
  final int price;
  final String currency;

  JobModel(this.title, this.id, this.rawContent, this.content, this.price,
      this.currency);

  JobModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        id = json['id'],
        rawContent = json['raw_content'],
        content = json['content'],
        price = json['price'],
        currency = json['currency'];
}
