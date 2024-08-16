import 'package:social_feed_task/features/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:social_feed_task/features/authentication/domain/entities/user.dart';
import 'package:social_feed_task/features/authentication/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Object> login({String? email, String? password}) async {
    // Attempt to login using the remote data source
    final token = await remoteDataSource.login(email!, password!);

    if (token != null) {
      // Token is returned, now retrieve the user's information
      final userData = await remoteDataSource.getUserData(email);

      // Convert userData to a User object and return it
      return User.fromJson(userData!);
    } else {
      // If login failed (invalid credentials), return null or handle the error
      return Exception();
    }
  }
}
