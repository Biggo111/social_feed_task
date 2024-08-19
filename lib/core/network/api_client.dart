import 'package:dio/dio.dart';
import 'mock_interceptor.dart';

class ApiClient {
  // final Dio _dio;
  // String? _accessToken;

  final Dio client = Dio();

  ApiClient() {
    client.interceptors.add(MockInterceptor());
  }

  // void setAccessToken(String token) {
  //   _accessToken = token;
  // }

  // Future<Response> get(String path) async {
  //   final options = Options(
  //     headers: _accessToken != null ? {'Authorization': 'Bearer $_accessToken'} : {},
  //   );
  //   return _dio.get(path, options: options);
  // }

}
