import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_26/Controller/auth_controller.dart';
import 'package:pas_mobile_11pplg2_26/Controller/dashboard_controller.dart';
import 'package:pas_mobile_11pplg2_26/Controller/show_controller.dart';

class DashboardBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.put(ShowController());
    Get.lazyPut<AuthController>(() => AuthController());
  }
}