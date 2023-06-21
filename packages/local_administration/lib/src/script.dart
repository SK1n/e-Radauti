import 'package:html/parser.dart' show parse;
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

void main() async {
  print('aaad');
  await fetchWebPage();
}

Future<void> fetchWebPage() async {
  Logger.level = Level.info;
  Logger log = Logger(
    level: Level.debug,
    printer: PrettyPrinter(),
    output: ConsoleOutput(),
  );

  try {
    var response = await Dio()
        .get('https://primariaradauti.ro/monitorul-oficial-local/hotarari-cl/');
    List elements = [];
    if (response.statusCode == 200) {
      var document = parse(response.data);
      var rawElements = document.querySelectorAll("div.entry-content ol a");
      for (var element in rawElements) {
        // add \s
        var title = element.text.replaceAll(RegExp('/\\s+/g'), '').trim();
        var link = element.attributes['href'];
        elements.add([title, link]);
      }

      //print(elements);
    } else {
      log.d(response.statusCode);
      //   throw NewsRepositoryException(
      //       '${response.statusMessage}\n ${response.statusCode}');
    }
  } catch (e) {
    log.d(e);
    // throw const NewsRepositoryException();
  }
}
