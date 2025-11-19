import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_26/Routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkLogin();
  }

  void checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 2));
    if (prefs.getString("username") != null) {
      Get.offAllNamed(AppRoutes.dashboardPage);
    }
    else {
      Get.offAllNamed(AppRoutes.loginPage);
    }
  }
}