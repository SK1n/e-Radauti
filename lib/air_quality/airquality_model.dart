class AirQualityModel {
  final int pm25;
  final int co2;
  final int humidity;
  final int temperature;

  AirQualityModel(this.pm25, this.co2, this.humidity, this.temperature);

  AirQualityModel.fromJson(Map<String, dynamic> json)
      : pm25 = json['p2'],
        co2 = json['co'],
        humidity = json['hm'],
        temperature=json['tp'];
     //   rawContent = json['raw_content'],
     //   content = json['content'],
     //   price = json['price'],
      //  currency = json['currency'];
}
