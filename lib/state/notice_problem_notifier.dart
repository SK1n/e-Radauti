import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class NoticeFormState extends ChangeNotifier {
  String _name;
  String _institutionEmail;
  String _subject;
  String _description;
  String _phoneNumber;
  String _email;
  String _typeName = 'Altele';
  String _institution;
  int _typeIndex = 0;
  Position _position;

  String get name => _name;
  String get institutionEmail => _institutionEmail;
  String get subject => _subject;
  String get description => _description;
  String get phoneNumber => _phoneNumber;
  String get email => _email;
  String get typeNmae => _typeName;
  String get institution => _institution;

  int get typeIndex => _typeIndex;
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
    _typeName = value;
    notifyListeners();
  }

  void upType(int index) {
    _typeIndex = index;
    notifyListeners();
  }

  void getPosition(Position position) {
    _position = position;
    notifyListeners();
    debugPrint('Position: $_position');
  }
}
