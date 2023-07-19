part of 'local_administration_repository.dart';

abstract class LocalAdministrationInterface {
  Future<DecisionModel> getLatestDecision();
  Future<List<DecisionModel>> getDecisions();
}

class ILocalAdministration implements LocalAdministrationInterface {
  final Dio _dio;
  ILocalAdministration({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<DecisionModel> getLatestDecision() async {
    var response = await _dio
        .get('https://primariaradauti.ro/monitorul-oficial-local/hotarari-cl/');
    if (response.statusCode == 200) {
      List elements = [];
      var document = parse(response.data);
      var rawElements = document.querySelectorAll("div.entry-content ol a");
      for (var element in rawElements) {
        var title = element.text.replaceAll(RegExp('/\\s+/g'), '').trim();
        var link = element.attributes['href'];
        elements.add(
          DecisionModel(
            title: title,
            url: link ?? "",
            year: '2023',
          ),
        );
      }
      return elements.last;
    } else {
      throw LocalAdministrationException.fromCode(response.statusCode ?? -1);
    }
  }

  @override
  Future<List<DecisionModel>> getDecisions() async {
    List<DecisionModel> elements = [];
    void parseResponseData(Response response, String year) {
      if (response.statusCode == 200) {
        var document = parse(response.data);
        var rawElements = document.querySelectorAll("div.entry-content ol a");
        for (var element in rawElements) {
          var title = element.text.replaceAll(RegExp('/\\s+/g'), '').trim();
          var link = element.attributes['href'];
          elements.add(
            DecisionModel(
              title: title,
              url: link ?? "",
              year: year,
            ),
          );
        }
      } else {
        throw LocalAdministrationException.fromCode(response.statusCode ?? -1);
      }
    }

    var response = await _dio
        .get('https://primariaradauti.ro/monitorul-oficial-local/hotarari-cl/');
    parseResponseData(response, '2023');

    response = await _dio.get(
        'https://primariaradauti.ro/consiliul-local/sedinte/proiecte-de-hotarari-de-cl/hotarari-adoptate-in-anul-2021/');
    parseResponseData(response, '2022');

    for (int year = 3; year > 0; year--) {
      response = await _dio.get(
          'https://primariaradauti.ro/consiliul-local/sedinte/proiecte-de-hotarari-de-cl/hotarari-adoptate-in-anul-${2018 + year}/');
      parseResponseData(response, '${2018 + year}');
    }

    for (int year = 7; year > 0; year--) {
      response = await _dio.get(
          'https://primariaradauti.ro/monitorul-oficial-local/hotarari-cl/anul-${2011 + year}/');
      parseResponseData(response, '${2011 + year}');
    }
    return elements;
  }
}
