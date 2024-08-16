import 'package:social_feed_task/core/network/api_client.dart';

class AuthService {
  final ApiClient _apiClient;

  AuthService(this._apiClient);

  // Future<void> login(String username, String password) async {
  //   final response = await _apiClient.get('/user/login');
  //   final token = response.data['token'];
  //   _apiClient.setAccessToken(token);
  // }
}
