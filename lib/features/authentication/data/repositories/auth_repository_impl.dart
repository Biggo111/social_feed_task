import 'package:social_feed_task/features/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:social_feed_task/features/authentication/domain/entities/user.dart';
import 'package:social_feed_task/features/authentication/domain/repositories/auth_repository.dart';
import 'package:social_feed_task/services/debugger/debugger.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Object> login({String? email, String? password}) async {

    debug(data: "Login Repository: $email, $password");
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

  @override
  Future<Object> fetchAllUser() async {
    final users = await remoteDataSource.fetchAllUser();

    return users;
  }

  @override
  Future<Object> getUserData(String email)async{
    final userData = await remoteDataSource.getUserData(email);

    return User.fromJson(userData!);
  }


  @override
  Future<Object> fetchMyData(String userId)async{
    final userData = await remoteDataSource.fetchMyData(userId);

    debug(data: "userData in fetchMyData: ${userData.name}");

    return User.fromJson(userData.toJson());
  }
}
