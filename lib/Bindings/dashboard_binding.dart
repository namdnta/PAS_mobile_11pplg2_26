import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_26/Controller/auth_controller.dart';
import 'package:pas_mobile_11pplg2_26/Controller/dashboard_controller.dart';
import 'package:pas_mobile_11pplg2_26/Controller/show_controller.dart';
import 'package:pas_mobile_11pplg2_26/Controller/favorite_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    // Ensure AuthController is available first
    if (!Get.isRegistered<AuthController>()) {
      Get.put<AuthController>(AuthController(), permanent: true);
    }
    // Use Get.put instead of lazyPut to ensure controller is immediately available
    Get.put<DashboardController>(DashboardController(), permanent: true);
    Get.put(ShowController());
    Get.put(FavoriteController());
  }
}