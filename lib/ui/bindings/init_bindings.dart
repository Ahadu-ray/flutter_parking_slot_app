import 'package:flutter_parking_spot_mobile_app/core/repositories/home_repositories.dart';
import 'package:flutter_parking_spot_mobile_app/core/services/location_service.dart';
import 'package:flutter_parking_spot_mobile_app/ui/controller/home_controller.dart';
import 'package:get/get.dart';

class InitBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(LocationService());
    Get.put(HomeRepository());
    Get.put(HomeController(
      homeRepository: Get.find(),
      locationService: Get.find(),
    ));
  }
}
