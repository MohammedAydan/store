abstract class ILocationService {
  Future<dynamic> getLocation();
  Future<dynamic> getLocationAndSave();
  Future<dynamic> saveLocation(dynamic data);
}
