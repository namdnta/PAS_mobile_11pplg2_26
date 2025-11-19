import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_26/Controller/auth_controller.dart';
import 'package:pas_mobile_11pplg2_26/Routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    // Wait for splash screen animation
    await Future.delayed(Duration(seconds: 3));
    
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final userData = prefs.getString('user');
      
      if (token != null && userData != null) {
        // User is logged in, get auth controller and set user data
        final authController = Get.find<AuthController>();
        await authController.checkLoginStatus();
        
        if (authController.isLoggedIn.value) {
          Get.offAllNamed(AppRoutes.dashboardPage);
        } else {
          Get.offAllNamed(AppRoutes.loginPage);
        }
      } else {
        // User is not logged in
        Get.offAllNamed(AppRoutes.loginPage);
      }
    } catch (e) {
      print('Error checking login status: $e');
      Get.offAllNamed(AppRoutes.loginPage);
    }
  }
}