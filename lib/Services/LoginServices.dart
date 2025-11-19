import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg2_26/Models/loginmodel.dart';


class LoginService {
  static const String baseUrl = 'https://mediadwi.com/api/latihan';

  static Future<LoginModel?> login(String username, String password) async {
    print('=== API SERVICE LOGIN CALLED ===');
    print('API LOGIN -> Received username: "$username" (length: ${username.length})');
    print('API LOGIN -> Received password: "$password" (length: ${password.length})');
    
    // Check if parameters are empty
    if (username.isEmpty || password.isEmpty) {
      print('API LOGIN -> ERROR: Empty username or password!');
      return LoginModel(
        status: false,
        message: 'Username dan password tidak boleh kosong',
        token: '',
      );
    }

    try {
      final requestBody = {
        'username': username,
        'password': password,
      };
      
      print('API LOGIN -> Request URL: $baseUrl/login');
      print('API LOGIN -> Request body: $requestBody');
      
      // Use multipart/form-data like in Postman (this is what works!)
      var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/login'));
      
      // Add form fields exactly like Postman
      request.fields['username'] = username;
      request.fields['password'] = password;
      
      // Set headers
      request.headers['Accept'] = 'application/json';
      
      print('API LOGIN -> Using MultipartRequest (form-data)');
      print('API LOGIN -> Fields: ${request.fields}');
      
      // Send request
      final streamedResponse = await request.send();
      final httpResponse = await http.Response.fromStream(streamedResponse);

      print('API LOGIN -> Response status: ${httpResponse.statusCode}');
      print('API LOGIN -> Response headers: ${httpResponse.headers}');
      print('API LOGIN -> Response body: ${httpResponse.body}');

      if (httpResponse.statusCode != 200) {
        // Log dan kembalikan model error
        return LoginModel(
          status: false,
          message: 'Server returned status ${httpResponse.statusCode}: ${httpResponse.body}',
          token: '',
        );
      }

      final jsonData = json.decode(httpResponse.body);
      print('API LOGIN -> Parsed JSON: $jsonData');

      final loginModel = LoginModel.fromJson(jsonData);

      print('API LOGIN -> Created LoginModel: $loginModel');
      
      // Enhanced token debug info
      if (loginModel.status && loginModel.token.isNotEmpty) {
        print('=== DEBUG API TOKEN RESPONSE ===');
        print('🎯 API Response Status: SUCCESS');
        print('🔑 EXTRACTED TOKEN: ${loginModel.token}');
        print('📏 Token Length: ${loginModel.token.length} characters');
        print('📝 Message: ${loginModel.message}');
        print('================================');
      } else {
        print('=== DEBUG API TOKEN ERROR ===');
        print('❌ API Response Status: FAILED');
        print('📝 Error Message: ${loginModel.message}');
        print('==============================');
      }
      
      return loginModel;
    } catch (e) {
      print('API LOGIN -> ERROR: $e');
      return LoginModel(
        status: false,
        message: 'Login failed: $e',
        token: '',
      );
    }
  }
}