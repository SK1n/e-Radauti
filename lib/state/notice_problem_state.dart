import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart' as latlng;

class NoticeFormState extends ChangeNotifier {
  String _name;
  String _institutionEmail = 'radautiulcivic@gmail.com';
  String _subject;
  String _description = '';
  String _phoneNumber;
  String _email;
  String _category = 'Altele';
  String _institution = 'Asociația Rădăuțiul Civic';
  int _index = 0;
  Position _position;
  bool _dialOpen = false;

  String get name => _name;
  String get institutionEmail => _institutionEmail;
  String get subject => _subject;
  String get description => _description;
  String get phoneNumber => _phoneNumber;
  String get email => _email;
  String get category => _category;
  String get institution => _institution;
  bool get dialOpen => _dialOpen;

  int get index => _index;
  Position get position => _position;

  void upName(String value) {
    _name = value;
    notifyListeners();
  }

  void upInstitution(String value) {
    _institution = value;
    notifyListeners();
  }

  void upInstitutionEmail(String value) {
    _institutionEmail = value;
    notifyListeners();
  }

  void upSubject(String value) {
    _subject = value;
    notifyListeners();
  }

  void upDescription(String value) {
    _description = value;
    notifyListeners();
  }

  void upPhoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  void upEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void upTypeName(String value) {
    _category = value;
    notifyListeners();
  }

  void upIndex(int index) {
    _index = index;
    notifyListeners();
  }

  void getPosition(Position position) {
    _position = position;
    debugPrint('$_position');
    notifyListeners();
  }

  void upDialOpen() {
    _dialOpen = !_dialOpen;
    notifyListeners();
  }
}
