// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) {
  try {
    return LoginModel.fromJson(json.decode(str));
  } catch (e) {
    print('Error parsing LoginModel: $e');
    // Return safe default if parsing fails
    return LoginModel(
      status: false,
      message: 'Error parsing response',
      token: '',
    );
  }
}

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    bool status;
    String message;
    String token;

    LoginModel({
        required this.status,
        required this.message,
        required this.token,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"] ?? false,
        message: json["message"]?.toString() ?? '',
        token: json["token"]?.toString() ?? '',
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "token": token,
    };

    @override
    String toString() {
        return 'LoginModel(status: $status, message: "$message", token: "$token")';
    }
}