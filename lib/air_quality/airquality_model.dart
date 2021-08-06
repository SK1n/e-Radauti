class AirQualityModel {
  final int pm25;
  final int co2;
  final double humidity;
  final double temperature;
  String airTS;

  AirQualityModel(
      this.pm25, this.co2, this.humidity, this.temperature, this.airTS);

  AirQualityModel.fromJson(Map<String, dynamic> json)
      : pm25 = json['p2'].toInt(),
        co2 = json['co'].toInt(),
        humidity = json['hm'].toDouble(),
        temperature = json['tp'].toDouble(),
        airTS = json['ts'].toString();
}
