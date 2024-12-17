import 'package:dio/dio.dart';
import 'package:store_app/data/services/location_services/i_location_service.dart';
import 'package:geolocator/geolocator.dart';

class LocationService extends ILocationService {
  final Dio dio;

  LocationService(this.dio);

  @override
  Future getLocation() async {
    try {
      final pos = await _determinePosition();
      String url =
          'https://nominatim.openstreetmap.org/reverse?format=json&lat=${pos.latitude}&lon=${pos.longitude}';
      final res = await dio.get(url);
      return res.data;
    } catch (e) {
      // handle the error
      print("An error occurred: $e");
      // return an empty object if an error occurred
      return {};
    }
  }

  @override
  Future getLocationAndSave() async {
    final location = await getLocation();
    await saveLocation(location);
    return location;
  }

  @override
  Future<void> saveLocation(data) async {
    await Future.delayed(const Duration(seconds: 2));
    // Here you can implement the logic to save the location data
    // For example, saving to a local database or shared preferences
    print("Location data saved: $data");
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
