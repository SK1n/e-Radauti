import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

part 'location_cubit.freezed.dart';
part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit()
      : super(const LocationState(
            position: null, status: LocationStatus.initial));

  Future<Position?> toggleLocationSwitch(bool isLocationEnabled) async {
    if (isLocationEnabled) {
      try {
        final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        return position;
      } catch (e) {
        return null;
      }
    } else {
      return null;
    }
  }
}
