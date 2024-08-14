import 'package:social_feed_task/features/authentication/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);
}
