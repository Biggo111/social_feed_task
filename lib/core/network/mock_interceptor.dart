import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;

class MockInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    String mockFilePath = '';
    final isAuthRequest = options.path.contains('/user/login');
    final isFeedRequest = options.path.contains('/feed');
    
    if (isAuthRequest) {
      mockFilePath = 'assets/json/user/login.json';
    } else if (isFeedRequest) {
      // Simulate access token validation
      final token = options.headers['Authorization']?.toString().replaceFirst('Bearer ', '');
      if (token != 'mock_access_token') {
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
}
