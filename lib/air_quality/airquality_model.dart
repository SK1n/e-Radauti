class AirQualityModel {
  final double pm25;
  final double co2;
  final double humidity;
  final double temperature;
  String datasiora;

  AirQualityModel(this.pm25, this.co2, this.humidity, this.temperature, this.datasiora);

  AirQualityModel.fromJson(Map<String, dynamic> json)
      : pm25 = json['p2'].toDouble(),
        co2 = json['co'].toDouble(),
        humidity = json['hm'].toDouble(),
        temperature = json['tp'].toDouble(),
        datasiora = json['ts'].toString();

}
