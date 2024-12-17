import 'package:get_storage/get_storage.dart';
import 'package:store_app/data/repositories/location_repository.dart';
import 'package:store_app/di.dart';

void oneOpen() {
  Future.microtask(_oneOpenInBackground);
}

Future<void> _oneOpenInBackground() async {
  try {
    final box = GetStorage();
    final LocationRepository locationRepository = di<LocationRepository>();
    const String isFirstTime = "isFirstTime";
    if (box.read(isFirstTime) == false) {
      return;
    }
    final res = await locationRepository.getLocationAndSave();
    print("oneOpen: ${res.toJson()}");
    print(res.toJson());
    await box.write(isFirstTime, false);
  } catch (e) {
    //
  }
}