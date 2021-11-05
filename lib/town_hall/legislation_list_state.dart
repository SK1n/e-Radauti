import 'package:flutter/foundation.dart';
import 'package:flutterapperadauti/town_hall/models/legislation_model.dart';

class LegislationListData extends ChangeNotifier {
  List<LegislationModel> _list = [];
  List<LegislationModel> get list => _list;
  String _query = '';
  String get query => _query;
  bool _foundResults = false;
  bool get foundResults => _foundResults;

  void getData() async {
    _list = await FetchLegislationData().getLegislationFromFirebase();
    notifyListeners();
  }

  void removeElements(String query) {
    debugPrint('query: $query');
    _list.removeWhere((element) =>
        !element.title.toLowerCase().contains(query.toLowerCase()));
    _query = query;
    notifyListeners();
  }

  void clearList() {
    _list = [];
    notifyListeners();
  }

  void clearQuery() {
    _query = '';
    notifyListeners();
  }
}
