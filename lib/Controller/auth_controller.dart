import 'dart:convert';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_26/Models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  var currentUser = Rxn<User>();
  var isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  // Check if user is already logged in
  Future<void> checkLoginStatus() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final userData = prefs.getString('user');
      
      if (token != null && userData != null) {
        currentUser.value = User.fromJson(jsonDecode(userData));
        isLoggedIn.value = true;
      } else {
        isLoggedIn.value = false;
      }
    } catch (e) {
      print('Error checking login status: $e');
      isLoggedIn.value = false;
    }
  }

  // Save login data (called from LoginController after successful login)
  Future<void> setLoginData(String token, User user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      await prefs.setString('user', jsonEncode(user.toJson()));
      
      currentUser.value = user;
      isLoggedIn.value = true;
    } catch (e) {
      print('Error saving login data: $e');
    }
  }

  // Logout user
  Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('token');
      await prefs.remove('user');
      
      currentUser.value = null;
      isLoggedIn.value = false;

      Get.snackbar(
        'Logout',
        'Anda telah logout',
        backgroundColor: Get.theme.colorScheme.primary,
        colorText: Get.theme.colorScheme.onPrimary,
      );

      Get.offAllNamed('/login');
    } catch (e) {
      print('Error during logout: $e');
    }
  }
}