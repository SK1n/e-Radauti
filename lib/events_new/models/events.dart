class Events {
  String url;
  String host;
  String street;
  String headline;
  String description;
  int start;
  int end;
  String category;
  String location;

  Events({
    this.category,
    this.description,
    this.end,
    this.headline,
    this.host,
    this.location,
    this.start,
    this.street,
    this.url,
  });

  factory Events.fromJson(Map<String, dynamic> json) {
    return Events(
      category: json['category'],
      description: json['description'],
      end: json['end'],
      start: json['start'],
      headline: json['headline'],
      host: json['host'],
      location: json['location'],
      street: json['street'],
      url: json['URL'],
    );
  }
}
