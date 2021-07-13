import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerNotifier with ChangeNotifier {
  Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
  Map<MarkerId, Marker> get marker => _markers;

  void markerMap(MarkerId markerId, Marker marker) {
    _markers[markerId] = marker;
    notifyListeners();
  }
}
