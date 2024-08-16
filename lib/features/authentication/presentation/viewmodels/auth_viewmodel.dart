
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_feed_task/features/authentication/domain/entities/user.dart';
import 'package:social_feed_task/features/authentication/domain/usecases/login_use_case.dart';
import 'package:social_feed_task/features/authentication/presentation/viewmodels/auth_generic/auth_generic.dart';
import 'package:social_feed_task/services/debugger/debugger.dart';

final authControllerProvider = StateNotifierProvider<AuthController, AuthGeneric>((ref) => AuthController(ref: ref));
class AuthController extends StateNotifier<AuthGeneric>{
  final Ref? ref;
  AuthController({this.ref}) : super(AuthGeneric());

  final LoginUseCase _loginUseCase = LoginUseCase();

  Future<void> login(String email, String password) async {
    state = state.update(isLoading: true);
    try {
      await Future.delayed(const Duration(seconds: 2));
      final userResponse = await _loginUseCase.loginUser(email, password);
      debug(data: "User Response: $userResponse");
      if(userResponse is User){
        state = state.update(isLoading: false, user: userResponse);
      } else{
        state = state.update(isLoading: false, error: true);
      }
    } catch (e) {
      state = state.update(error: true);
    }
  }
}