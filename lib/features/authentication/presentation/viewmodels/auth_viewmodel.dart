import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_feed_task/features/authentication/domain/entities/user.dart';
import 'package:social_feed_task/features/authentication/domain/usecases/login_use_case.dart';
import 'package:social_feed_task/features/authentication/presentation/screens/login_screen.dart';
import 'package:social_feed_task/features/authentication/presentation/viewmodels/auth_generic/auth_generic.dart';
import 'package:social_feed_task/features/authentication/presentation/viewmodels/mixin/process_auth_mixin.dart';
import 'package:social_feed_task/services/debugger/debugger.dart';
import 'package:social_feed_task/services/di/service_locator_di.dart';
import 'package:social_feed_task/services/navigation_service/navigator.dart';
import 'package:social_feed_task/startup/startup_screen.dart';

final authControllerProvider = StateNotifierProvider<AuthController, AuthGeneric>((ref) => AuthController(ref: ref));
class AuthController extends StateNotifier<AuthGeneric> with ProcessAuthMixin{
  final Ref? ref;
  AuthController({this.ref}) : super(AuthGeneric());

  final LoginUseCase _loginUseCase = LoginUseCase();

  Future<void> login(String email, String password) async {
    state = state.update(isLoading: true);
    try {
      await Future.delayed(const Duration(seconds: 1));
      // if(!isEmailPasswordGiven(email, password)){
      //   ShowToast.customToast("Email and Password are required", bgColor: AppColors.red);
      //   return;
      // }
      isEmailPasswordGiven(email, password);
      final userResponse = await _loginUseCase.loginUser(email, password);
      
      if(userResponse is User){
        debug(data: "User Response: ${userResponse.name}");
        state = state.update(isLoading: false, user: userResponse, error: false);
        handleAfterLoginNavigation();
      } else{
        state = state.update(isLoading: false, error: true);
        wrongEmailPassword();
      }
    } catch (e) {
      state = state.update(error: true);
    }
  }

  void handleAfterLoginNavigation(){
    if(!state.error){
      debug(data: "User Logged In: ${state.user!.email}");
      NavigationService.navigatorKey.currentState!.push(CupertinoPageRoute(builder: (context) => const StartupScreen()));
    } else{
      debug(data: "Login Failed");
    }
  }

  void togglePasswordVisibility() {
    state = state.update(passwordVisible: !state.passwordVisible);
  }

  void toggleRememberMe(){
    state = state.update(toggleRememberMe: !state.toggleRememberMe);
  }

  void handleLogout(){
    state = state.update(user: null);
    final pref = sl<SharedPreferences>();
    pref.remove('auth_token');

    NavigationService.navigatorKey.currentState!.pushAndRemoveUntil(CupertinoPageRoute(builder: (context) => const LoginScreen()), (route) => false);
  }

}