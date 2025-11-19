import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg2_26/Controller/auth_controller.dart';
import 'package:pas_mobile_11pplg2_26/Models/user_model.dart';

class LoginController extends GetxController {
  var username = "".obs;
  var password = "".obs;
  var isLoading = false.obs;

  void updateUsername(String value) => username.value = value;
  void updatePassword(String value) => password.value = value;

  Future<void> login() async {
    if (username.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Username & Password required");
      return;
    }

    try {
      isLoading.value = true;

      final url = Uri.parse("https://mediadwi.com/api/latihan/login");
      final response = await http.post(url, body: {
        "username": username.value,
        "password": password.value,
      });

      final data = jsonDecode(response.body);
      print("LOGIN RESPONSE: $data");

      isLoading.value = false;

      if (data["status"] == true) {
        // Create user object from response
        User user = User(
          username: username.value,
          fullName: data["data"]?["full_name"] ?? username.value,
          email: data["data"]?["email"] ?? "",
          token: data["token"],
        );

        // Save login data using AuthController
        final authController = Get.find<AuthController>();
        await authController.setLoginData(data["token"], user);

        Get.snackbar("Success", "Login successful!");
        Get.offAllNamed("/dashboardpage");
      } else {
        Get.snackbar("Failed", data["message"] ?? "Login failed");
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", e.toString());
    }
  }
}
