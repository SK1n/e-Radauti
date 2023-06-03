import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterapperadauti/data/models/air_quality/air_quality_item_model.dart';
import 'package:flutterapperadauti/data/models/air_quality/air_quality_model.dart';
import 'package:flutterapperadauti/modules/air_quality/views/charts/create_chart.dart';
import 'package:flutterapperadauti/repositories/firebase_repository.dart';
import 'package:flutterapperadauti/utils/assets.dart';
import 'package:flutterapperadauti/utils/base_controller.dart';
import 'package:intl/intl.dart';

class AirQualityController extends BaseController {
  final FirebaseRepository _fireRepo;
  AirQualityController(this._fireRepo);

  List<ChartSampleData> dataChartPmVsTimeCenter = [];
  List<ChartSampleData> dataChartPmVsTimeDornesti = [];
  List<ChartSampleData> dataChartWindVsTimeCenter = [];
  List<ChartSampleData> dataChartWindVsTimeDornesti = [];
  List<ChartSampleData> dataChartCoVsTime = [];
  List<ChartSampleData> dataChartTempVsTimeCenter = [];
  List<ChartSampleData> dataChartHumidityCenter = [];
  List<ChartSampleData> recommendedPmValue = [];

  Future getDataCharts() async {
    DocumentReference dr = _fireRepo.firestore.doc('collection/AirDatabase3');
    var data = await _fireRepo.getDocument(
      convert: AirQualityModel.fromJson,
      document: dr,
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
    DocumentReference dr = _fireRepo.firestore.doc('collection/AirDatabase3');
    AirQualityModel airQualityModel = await _fireRepo.getDocument(
      convert: AirQualityModel.fromJson,
      document: dr,
    );
    List<AirQualityItemModel> items = airQualityModel.items;
    return items.last;
  }

  String bindQualityImage(int image) {
    switch (image) {
      case 0:
        return Assets.facesBuna;
      case 1:
        return Assets.facesAcceptabila;
      case 2:
        return Assets.facesModerata;
      case 3:
        return Assets.facesRea;
      case 4:
        return Assets.facesFoarteRea;
      case 5:
        return Assets.facesExtremDeRea;
      default:
        return Assets.facesExtremDeRea;
    }
  }
}
