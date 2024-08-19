import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthRemoteDataSource {
  Future<String?> login(String email, String password);
  Future<Map<String, dynamic>?> getUserData(String email);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);
  
  @override
  Future<String?> login(String email, String password) async {
    try {
      final String response = await rootBundle.loadString('assets/json/user/users.json');
      final data = json.decode(response);

      final user = data['users'].firstWhere(
        (user) => user['email'] == email && user['password'] == password,
        orElse: () => null,
      );

      if (user != null) {
        final token = generateToken();

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', token);

        return token;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Failed to authenticate');
    }
  }


  @override
  Future<Map<String, dynamic>?> getUserData(String email) async {
    final String response = await rootBundle.loadString('assets/json/user/users.json');
    final data = json.decode(response);

    final user = data['users'].firstWhere(
      (user) => user['email'] == email,
      orElse: () => null,
    );

    return user;
  }

  String generateToken() {
    final random = Random();
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    return List.generate(20, (index) => chars[random.nextInt(chars.length)]).join();
  }
  

}
