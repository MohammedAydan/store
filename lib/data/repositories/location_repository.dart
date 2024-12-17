import 'package:store_app/data/models/my_location_model.dart';
import 'package:store_app/data/services/location_services/i_location_service.dart';

class LocationRepository {
  final ILocationService _locationService;

  LocationRepository(this._locationService);

  Future<MyLocationModel> getLocation() async {
    final res = await _locationService.getLocation();
    return MyLocationModel.fromJson(res);
  }

  Future<MyLocationModel> getLocationAndSave() async {
    final res = await _locationService.getLocationAndSave();
    return MyLocationModel.fromJson(res);
  }

  Future<void> saveLocation(MyLocationModel data) async {
    await _locationService.saveLocation(data.toJson());
  }
}
