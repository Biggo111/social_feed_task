abstract class AuthRepository {
  Future<Object> login({String email, String password});
}

// abstract class AuthRepository {
//   Future<Either<Failure, String>> login(String email, String password);
// }
