import 'package:social_feed_task/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:social_feed_task/features/authentication/domain/repositories/auth_repository.dart';
import 'package:social_feed_task/services/di/service_locator_di.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase() : repository = sl.get<AuthRepositoryImpl>();

  Future<Object> loginUser(String email, String password) async {
    return await repository.login(email: email, password: password);
  }

  Future<Object> fetchAllUser()async{
    return await repository.fetchAllUser();
  }

  Future<Object> getUserData(String email)async{
    return await repository.getUserData(email);
  }

  Future<Object> fetchMyData(String userId)async{
    return await repository.fetchMyData(userId);
  }
}
