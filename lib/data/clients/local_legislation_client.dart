// ignore_for_file: prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings, depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/local_legislation/local_legislation_item_model.dart';
import 'package:flutterapperadauti/data/models/local_legislation/local_legislation_model.dart';
import 'package:html/parser.dart' show parse;

class LocalLegislationClient {
  const LocalLegislationClient();

  Future<LocalLegislationModel> getData(int year) async {
    int currentYear = DateTime.now().year;
    var response = await Dio().get(
        'https://primariaradauti.ro/monitorul-oficial-local/hotarari-cl/${year != currentYear ? 'hotarari-adoptate-in-anul-$year' : ''}');
    List elements = [];
    if (response.statusCode == 200) {
      var document = parse(response.data);
      var rawElements = document.querySelectorAll("div.entry-content ol a");

      for (var element in rawElements) {
        var title = element.text.replaceAll(RegExp('/\s+/g'), '').trim();
        var link = element.attributes['href'];
        elements.add([title, link]);
      }
    }
    return _createJson(elements);
  }

  LocalLegislationModel _createJson(List elements) {
    // debugPrint(elements.length.toString());
    var year = DateTime.now().year;
    List<LocalLegislationItemModel> items = [];
    // var json = '{"$year":[';

    for (var element in elements) {
      // json += '{"link":"' +
      //     element[1] +
      //     '"' +
      //     ',"title":"' +
      //     element[0] +
      //     '","an":"' +
      //     year.toString() +
      //     '" },';
      items.add(
          LocalLegislationItemModel(year.toString(), element[1], element[0]));
    }
    return LocalLegislationModel(items);
  }
}
