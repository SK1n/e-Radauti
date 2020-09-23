class AirQualityModel {
  final double pm25;
  final double co2;
  final double humidity;
  final double temperature;

  AirQualityModel(this.pm25, this.co2, this.humidity, this.temperature);

  AirQualityModel.fromJson(Map<String, dynamic> json)
      : pm25 = json['p2'].toDouble(),
        co2 = json['co'].toDouble(),
        humidity = json['hm'].toDouble(),
        temperature = json['tp'].toDouble();
  //   rawContent = json['raw_content'],
  //   content = json['content'],
  //   price = json['price'],
  //  currency = json['currency'];
}
