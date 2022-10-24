import 'package:get/get.dart';
import 'package:location/location.dart';

class LocationController extends GetxController {
  var location = Location();
  bool? _serviceEnabled;
  dynamic enabled = true.obs;
  Future<bool> get hasPermissions async =>
      checkPermissionGranted().then((value) => value);
  PermissionStatus? _permissionGranted;

  Future<bool> checkServiceEnabled() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled!) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled!) {
        return false;
      }
    }
    return true;
  }

  Future<bool> checkPermissionGranted() async {
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        enabled.value = false;
        return false;
      }
    }
    return true;
  }

  Future<LocationData> getLocation() async {
    return await location.getLocation();
  }

  Future<double?> getLatitute() async {
    return await location.getLocation().then((value) => value.latitude);
  }

  Future<double?> getLongitude() async {
    return await location.getLocation().then((value) => value.longitude);
  }
}
