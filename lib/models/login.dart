import 'package:meta/meta.dart';
import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  final String userId;
  final String userLogin;
  final int userType;
  final dynamic role;
  final String accessToken;
  final String refreshToken;

  Login({
    required this.userId,
    required this.userLogin,
    required this.userType,
    required this.role,
    required this.accessToken,
    required this.refreshToken,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        userId: json["userId"],
        userLogin: json["userLogin"],
        userType: json["userType"],
        role: json["role"],
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "userLogin": userLogin,
        "userType": userType,
        "role": role,
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };
}