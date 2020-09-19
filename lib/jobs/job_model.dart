class JobModel {
  final String title;
  final int id;
  final String rawContent;
  final String content;

  JobModel(this.title, this.id, this.rawContent, this.content);

  JobModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        id = json['id'],
        rawContent = json['raw_content'],
        content = json['content'];
}
