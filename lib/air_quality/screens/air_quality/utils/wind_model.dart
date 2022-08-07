class WindModel {
  final String wind;
  final String pression;

  WindModel(this.wind, this.pression);

  WindModel.fromJson(Map<String, dynamic> json)
      : wind = json['vant'],
        pression = json['presiunetext'];
}
