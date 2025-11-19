import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  var username = "".obs;
  var password = "".obs;
  var fullName = "".obs;
  var email = "".obs;
  var isLoading = false.obs;

  void updateUsername(String value) => username.value = value;
  void updatePassword(String value) => password.value = value;
  void updateFullName(String value) => fullName.value = value;
  void updateEmail(String value) => email.value = value;

  Future<bool> register() async {
    if (username.isEmpty || password.isEmpty || fullName.isEmpty || email.isEmpty) {
      Get.snackbar("Error", "All fields are required");
      return false;
    }

    try {
      isLoading.value = true;

      final url = Uri.parse("https://mediadwi.com/api/latihan/register-user");
      final response = await http.post(url, body: {
        "username": username.value,
        "password": password.value,
        "full_name": fullName.value,
        "email": email.value,
      });

      isLoading.value = false;

      final data = jsonDecode(response.body);
      print("REGISTER RESPONSE: $data");

      if (data["status"] == true) {
        Get.snackbar("Success", "Account created!");
        return true;
      } else {
        Get.snackbar("Failed", data["message"] ?? "Failed to register");
        return false;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
      isLoading.value = false;
      return false;
    }
  }
}
