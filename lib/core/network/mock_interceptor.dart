import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:shared_preferences/shared_preferences.dart';

class MockInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    String mockFilePath = '';
    final isAuthRequest = options.path.contains('/user/users');
    final isFeedRequest = options.path.contains('/feed');
    
    
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    
    if (token != null && !isAuthRequest) {
      options.headers['Authorization'] = 'Bearer $token';
    }


    if (isAuthRequest) {
      mockFilePath = 'assets/json/user/users.json';
    } else if (isFeedRequest) {
      if (token == null) {
        handler.reject(DioException(
          requestOptions: options,
          response: Response(
            requestOptions: options,
            statusCode: 401,
            statusMessage: 'Unauthorized',
          ),
        ));
        return;
      }
      mockFilePath = 'assets/json/feed/posts.json';
    }

    
    if (mockFilePath.isNotEmpty) {
      final mockData = await rootBundle.loadString(mockFilePath);
      handler.resolve(Response(
        requestOptions: options,
        statusCode: 200,
        data: json.decode(mockData),
      ));
    } else {
      super.onRequest(options, handler);
    }
  }

  @override
  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
   
    if (response.requestOptions.path.contains('/user/users')) {
      final token = response.data['token'];
      if (token != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', token);
      }
    }
    handler.next(response);
  }
}
