// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutterapperadauti/data/clients/local_legislation_client.dart';

void main() async {
  TownHallClient client = const TownHallClient();
  test('LocalLegislationClient',
      () async => expectLater(await client.getData(2022), contains('2022')));
}
