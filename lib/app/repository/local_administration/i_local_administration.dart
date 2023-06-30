import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutterapperadauti/app/models/local_administration/decision_model.dart';
import 'package:flutterapperadauti/app/models/local_administration/local_council_first_table_model.dart';
import 'package:flutterapperadauti/app/models/local_administration/local_council_model.dart';
import 'package:flutterapperadauti/app/models/local_administration/local_council_second_table_model.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart' show parse;
import 'package:logger/logger.dart';

class _Filter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}

abstract class LocalAdministrationInterface {
  Future<DecisionModel> getLatestDecision();
  Future<List<DecisionModel>> getDecisions();
  Future<List<LocalCouncilFirstTableModel>> getLocalCouncilFirstTable();
  Future<List<LocalCouncilSecondTableModel>> getLocalCouncilSecondTable();
  Future<List<LocalCouncilModel>> getLocalCouncil();
}

class LocalAdministrationException implements Exception {
  const LocalAdministrationException([
    this.message = "An unknown exception occurred.",
  ]);

  final String message;

  factory LocalAdministrationException.fromCode(int statusCode) {
    switch (statusCode) {
      case 400:
        return const LocalAdministrationException('Bad Request');
      case 401:
        return const LocalAdministrationException('Unauthorized');
      case 403:
        return const LocalAdministrationException('Forbidden');
      case 404:
        return const LocalAdministrationException('Not Found');
      case 500:
        return const LocalAdministrationException('Internal server error');
      default:
        return const LocalAdministrationException();
    }
  }
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

  @override
  Future<List<LocalCouncilFirstTableModel>> getLocalCouncilFirstTable() async {
    var response = await _dio.get(
      'https://primariaradauti.ro/consiliul-local/consilieri-locali/',
    );
    if (response.statusCode != 200) {
      throw LocalAdministrationException.fromCode(response.statusCode ?? -1);
    }
    List<LocalCouncilFirstTableModel> councilList = [];
    Document document = parse(response.data);
    List<Element> rows = document.querySelectorAll('tr');
    for (Element row in rows) {
      List<Element> columns = row.querySelectorAll('td');
      if (columns.length == 6) {
        String name = columns[0].text.trim().replaceAll('/n', ' ');
        String imageUrl =
            columns[1].querySelector('img')?.attributes['src'] ?? '';
        String party = columns[2].querySelector('img')?.attributes['src'] ?? '';
        List<String> wealth = columns[3]
            .querySelectorAll('a')
            .map((e) => e.attributes['href'] ?? '')
            .toList();
        List<String> interests = columns[4]
            .querySelectorAll('a')
            .map((e) => e.attributes['href'] ?? '')
            .toList();
        String fbUrl = columns[5]
            .getElementsByClassName('alignleft wp-image-1766')
            .map((e) => e.attributes['srcset'] ?? '')
            .first;

        councilList.add(LocalCouncilFirstTableModel(
          name: name,
          imageUrl: imageUrl,
          party: party,
          wealth: wealth,
          interests: interests,
          fbUrl: fbUrl,
        ));
      }
    }

    return councilList;
  }

  @override
  Future<List<LocalCouncilSecondTableModel>>
      getLocalCouncilSecondTable() async {
    var response = await _dio.get(
        'https://primariaradauti.ro/2021/02/05/date-de-contact-consilieri-locali/');
    if (response.statusCode != 200) {
      throw LocalAdministrationException.fromCode(response.statusCode ?? -1);
    }
    List<List<String?>> tableData = [];
    Document document = parse(response.data);
    List<Element> rows = document.querySelectorAll('tr');
    for (Element row in rows) {
      List<Element> cells = row.querySelectorAll('td');
      List<String?> rowData = cells.map((cell) {
        String text = cell.text.trim();
        if (text == '–') {
          return null;
        } else {
          return text;
        }
      }).toList();
      tableData.add(rowData);
    }
    return tableData.skip(1).map((rowData) {
      return LocalCouncilSecondTableModel(
        name: rowData[1]!,
        email: rowData[2],
        phoneNumber: rowData[3],
      );
    }).toList();
  }

  @override
  Future<List<LocalCouncilModel>> getLocalCouncil() async {
    Logger log = Logger(
      filter: _Filter(),
      printer: PrettyPrinter(
        printEmojis: false,
      ),
      output: FileOutput(file: File('logs.txt')),
    );

    try {
      var firstTable = await getLocalCouncilFirstTable();
      var secondTable = await getLocalCouncilSecondTable();

      firstTable.sort((a, b) => a.name.compareTo(b.name));
      secondTable.sort((a, b) => a.name.compareTo(b.name));
      log.d(firstTable);
      for (int index = 0; index < firstTable.length; index++) {
        log.d('${firstTable[index].fbUrl} : ${secondTable[index].name}');
      }
      return [
        const LocalCouncilModel(
          name: '',
          imageUrl: '',
          party: '',
          wealth: [],
          interests: [],
          email: '',
          phoneNumber: '',
          fbUrl: '',
        )
      ];
    } catch (e) {
      rethrow;
    }
  }
}
