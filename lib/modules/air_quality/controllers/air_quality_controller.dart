import 'package:flutterapperadauti/data/models/air_quality/air_quality_item_model.dart';
import 'package:flutterapperadauti/data/models/air_quality/air_quality_model.dart';
import 'package:flutterapperadauti/modules/air_quality/views/charts/create_chart.dart';
import 'package:flutterapperadauti/utils/assets.dart';
import 'package:flutterapperadauti/utils/helpers/get_data_firebase.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AirQualityController extends GetxController with GetDataFirebase {
  List<ChartSampleData> dataChartPmVsTimeCenter = [];
  List<ChartSampleData> dataChartPmVsTimeDornesti = [];
  List<ChartSampleData> dataChartWindVsTimeCenter = [];
  List<ChartSampleData> dataChartWindVsTimeDornesti = [];
  List<ChartSampleData> dataChartCoVsTime = [];
  List<ChartSampleData> dataChartTempVsTimeCenter = [];
  List<ChartSampleData> dataChartHumidityCenter = [];
  List<ChartSampleData> recommendedPmValue = [];

  Future getDataCharts() async {
    var data = await getData(
      convert: AirQualityModel.fromJson,
      document: 'AirDatabase3',
    );
    List<AirQualityItemModel>? items = data.items;
    for (int index = 0; index <= items!.length - 1; index++) {
      AirQualityItemModel item = items[index];
      DateTime tempDate = DateFormat('dd/MM/yyyy HH:mm').parse(item.dateTime);
      dataChartPmVsTimeCenter.add(
        ChartSampleData(
          x: tempDate,
          yValue: item.centerPm.toDouble(),
          color: item.centerColor,
        ),
      );
      dataChartPmVsTimeDornesti.add(
        ChartSampleData(
          x: tempDate,
          yValue: item.dornestiPm.toDouble(),
        ),
      );
      dataChartTempVsTimeCenter.add(
        ChartSampleData(
          x: tempDate,
          yValue: item.centerTemp.toDouble(),
        ),
      );
      dataChartCoVsTime.add(
        ChartSampleData(
          x: tempDate,
          yValue: item.centerCo.toDouble(),
        ),
      );
      dataChartWindVsTimeCenter.add(
        ChartSampleData(
          x: tempDate,
          yValue: item.roMeteoWindSpeed.toDouble(),
        ),
      );
      dataChartWindVsTimeDornesti.add(
        ChartSampleData(
          x: tempDate,
          yValue: item.dornestiWindSpeed.toDouble(),
        ),
      );
      dataChartHumidityCenter.add(
        ChartSampleData(
          x: tempDate,
          yValue: item.centerHm.toDouble(),
        ),
      );
      recommendedPmValue.add(
        ChartSampleData(
          x: tempDate,
          yValue: 20,
        ),
      );
    }
  }

  Future getAirQualityCurrent() async {
    AirQualityModel airQualityModel = await getData(
      document: 'AirDatabase3',
      convert: AirQualityModel.fromJson,
    );
    List<AirQualityItemModel> items = airQualityModel.items;
    return items.last;
  }

  String bindQualityImage(int image) {
    switch (image) {
      case 0:
        return Assets.assetsFacesBuna;
      case 1:
        return Assets.assetsFacesAcceptabila;
      case 2:
        return Assets.assetsFacesModerata;
      case 3:
        return Assets.assetsFacesRea;
      case 4:
        return Assets.assetsFacesFoarteRea;
      case 5:
        return Assets.assetsFacesExtremDeRea;
      default:
        return Assets.assetsFacesExtremDeRea;
    }
  }
}
