import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_26/Controller/auth_controller.dart';
import 'package:pas_mobile_11pplg2_26/Controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // Ensure AuthController is available first
    if (!Get.isRegistered<AuthController>()) {
      Get.put<AuthController>(AuthController(), permanent: true);
    }
    Get.lazyPut<LoginController>(() => LoginController());
  }
}