import 'package:dio/dio.dart';
import 'package:html/parser.dart' show parse;
import 'package:local_administration/src/models/decision_model.dart';
import 'package:logger/logger.dart';

enum NewsState {
  initial,
  inProgress,
  success,
  failure,
}

extension NewsX on NewsState {
  bool get isInitial => this == NewsState.initial;
  bool get isInProgress => this == NewsState.inProgress;
  bool get isSuccess => this == NewsState.success;
  bool get isFalure => this == NewsState.failure;
}

class LocalAdministrationException implements Exception {
  const LocalAdministrationException([
    this.message = "An unknown exception occurred.",
  ]);

  final String message;
}

class MyFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}

class LocalAdministrationRepository {
  LocalAdministrationRepository({Logger? log})
      : _log = log ??
            Logger(
              level: Level.debug,
              filter: MyFilter(),
              //output: FileOutput(file: File('logs.txt')),
              output: ConsoleOutput(),
              printer: PrettyPrinter(
                printEmojis: false,
              ),
            );

  final Logger _log;

  Future<DecisionModel> getLatestDecision() async {
    try {
      var response = await Dio().get(
          'https://primariaradauti.ro/monitorul-oficial-local/hotarari-cl/');
      List elements = [];
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
              year: '2023',
            ),
          );
        }
        return elements.last;
      } else {
        throw LocalAdministrationException(
            '${response.statusMessage}\n ${response.statusCode}');
      }
    } catch (e) {
      throw const LocalAdministrationException();
    }
  }

  Future<void> getDecisions() async {
    try {
      Dio dio = Dio();
      List<DecisionModel> elements = [];

      // Helper function to parse the response data and add DecisionModels
      void parseResponseData(Response response, String year) {
        if (response.statusCode == 200) {
          var document = parse(response.data);
          var rawElements = document.querySelectorAll("div.entry-content ol a");
          for (var element in rawElements) {
            var title = element.text.replaceAll(RegExp(r'\s+'), '').trim();
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
          throw const LocalAdministrationException();
        }
      }

      var response = await dio.get(
          'https://primariaradauti.ro/monitorul-oficial-local/hotarari-cl/');
      parseResponseData(response, '2023');

      response = await dio.get(
          'https://primariaradauti.ro/consiliul-local/sedinte/proiecte-de-hotarari-de-cl/hotarari-adoptate-in-anul-2021/');
      parseResponseData(response, '2022');

      for (int year = 3; year > 0; year--) {
        response = await dio.get(
            'https://primariaradauti.ro/consiliul-local/sedinte/proiecte-de-hotarari-de-cl/hotarari-adoptate-in-anul-${2018 + year}/');
        parseResponseData(response, '${2018 + year}');
      }

      for (int year = 7; year > 0; year--) {
        response = await dio.get(
            'https://primariaradauti.ro/monitorul-oficial-local/hotarari-cl/anul-${2011 + year}/');
        parseResponseData(response, '${2011 + year}');
      }
    } on LocalAdministrationException catch (e) {
      throw LocalAdministrationException(e.message);
    }
  }
}
