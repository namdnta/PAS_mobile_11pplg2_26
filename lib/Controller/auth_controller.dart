import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_26/Models/loginmodel.dart';
import 'package:pas_mobile_11pplg2_26/Pages/showPage.dart';
import 'package:pas_mobile_11pplg2_26/Services/LoginServices.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {

  var username = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;


void clearForm() {
    username.value = '';
    password.value = '';
  }

  void updateUsername(String value) {
    username.value = value;
  }

  void updatePassword(String value) {
    password.value = value;
  }

  // === LOGIN VIA API ===
  Future<LoginModel?> login() async {
    print('=== LOGIN METHOD CALLED ===');
    print('Username: ${username.value}, Password: ${password.value}');

    String actualUsername = username.value.trim();
    String actualPassword = password.value.trim();

    if (actualUsername.isEmpty || actualPassword.isEmpty) {
      Get.snackbar(
        'Error',
        'Username dan password tidak boleh kosong',
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Get.theme.colorScheme.onError,
      );
      return null;
    }

    isLoading.value = true;

    try {
      final result = await LoginService.login(actualUsername, actualPassword);
      if (result != null && result.status) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', result.token);

        Get.snackbar(
          'Login Berhasil 🎉',
          result.message.isNotEmpty ? result.message : 'Login berhasil',
          backgroundColor: Get.theme.colorScheme.primary,
          colorText: Get.theme.colorScheme.onPrimary,
          snackPosition: SnackPosition.BOTTOM,
        );

        Future.delayed(const Duration(seconds: 1), () {
          Get.off(() => Showpage());
        });

        return result;
      } else {
        Get.snackbar(
          'Login Gagal ❌',
          result?.message ?? 'Terjadi kesalahan saat login',
          backgroundColor: Get.theme.colorScheme.error,
          colorText: Get.theme.colorScheme.onError,
          snackPosition: SnackPosition.BOTTOM,
        );
        return null;
      }
    } catch (e) {
      Get.snackbar(
        'Error ⚠️',
        'Tidak dapat terhubung ke server: $e',
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Get.theme.colorScheme.onError,
      );
      return null;
    } finally {
      isLoading.value = false;
    }
  }
}