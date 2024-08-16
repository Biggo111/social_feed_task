// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'package:flutter/services.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class AuthLocalDataSource {
//   final Dio dio;

//   AuthLocalDataSource(this.dio);

//   Future<String?> login(String email, String password) async {
//     try {
//       // Load the login.json file from assets
//       final String response = await rootBundle.loadString('assets/json/user/login.json');
//       final data = json.decode(response);

//       // Check if the credentials match any user
//       final user = data['users'].firstWhere(
//         (user) => user['email'] == email && user['password'] == password,
//         orElse: () => null,
//       );

//       if (user != null) {
//         // If credentials match, generate a mock token
//         const token = 'mock_access_token';

//         // Store the token in SharedPreferences
//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setString('auth_token', token);

//         return token;
//       } else {
//         // If credentials do not match, return null or throw an exception
//         return null;
//       }
//     } catch (e) {
//       throw Exception('Failed to authenticate');
//     }
//   }
// }
