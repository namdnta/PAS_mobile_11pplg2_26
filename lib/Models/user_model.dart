class User {
  final String username;
  final String email;
  final String fullName;
  final String? token;

  User({
    required this.username,
    required this.email,
    required this.fullName,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      fullName: json['full_name'] ?? '',
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'full_name': fullName,
      'token': token,
    };
  }
}

class LoginRequest {
  final String username;
  final String password;

  LoginRequest({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}

class RegisterRequest {
  final String username;
  final String password;
  final String fullName;
  final String email;

  RegisterRequest({
    required this.username,
    required this.password,
    required this.fullName,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'full_name': fullName,
      'email': email,
    };
  }
}

class LoginResponse {
  final bool status;
  final String message;
  final String? token;
  final User? user;

  LoginResponse({
    required this.status,
    required this.message,
    this.token,
    this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      token: json['token'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }
}