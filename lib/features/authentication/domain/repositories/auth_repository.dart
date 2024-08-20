abstract class AuthRepository {
  Future<Object> login({String email, String password});
  Future<Object> fetchAllUser();
  Future<Object> getUserData(String email);
}

// abstract class AuthRepository {
//   Future<Either<Failure, String>> login(String email, String password);
// }
