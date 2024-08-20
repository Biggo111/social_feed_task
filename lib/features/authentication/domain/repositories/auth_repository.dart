abstract class AuthRepository {
  Future<Object> login({String email, String password});
  Future<Object> fetchAllUser();
}

// abstract class AuthRepository {
//   Future<Either<Failure, String>> login(String email, String password);
// }
