import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_feed_task/core/constants/colors_palette.dart';
import 'package:social_feed_task/core/global_components/toast/show_toast.dart';
import 'package:social_feed_task/features/authentication/domain/entities/user.dart';
import 'package:social_feed_task/features/authentication/domain/usecases/login_use_case.dart';
import 'package:social_feed_task/features/authentication/presentation/viewmodels/auth_generic/auth_generic.dart';
import 'package:social_feed_task/features/authentication/presentation/viewmodels/mixin/process_auth_mixin.dart';
import 'package:social_feed_task/features/social_feed/presentation/screens/feed_screen/feed_screen.dart';
import 'package:social_feed_task/services/debugger/debugger.dart';
import 'package:social_feed_task/services/navigation_service/navigator.dart';

final authControllerProvider = StateNotifierProvider<AuthController, AuthGeneric>((ref) => AuthController(ref: ref));
class AuthController extends StateNotifier<AuthGeneric> with ProcessAuthMixin{
  final Ref? ref;
  AuthController({this.ref}) : super(AuthGeneric());

  final LoginUseCase _loginUseCase = LoginUseCase();

  Future<void> login(String email, String password) async {
    state = state.update(isLoading: true);
    try {
      await Future.delayed(const Duration(seconds: 1));
      if(!isEmailPasswordGiven(email, password)){
        ShowToast.customToast("Email and Password are required", bgColor: AppColors.red);
        return;
      }
      final userResponse = await _loginUseCase.loginUser(email, password);
      
      if(userResponse is User){
        debug(data: "User Response: ${userResponse.name}");
        state = state.update(isLoading: false, user: userResponse, error: false);
        handleNavigation();
      } else{
        state = state.update(isLoading: false, error: true);
      }
    } catch (e) {
      state = state.update(error: true);
    }
  }

  void handleNavigation(){
    if(!state.error){
      debug(data: "User Logged In: ${state.user!.email}");
      NavigationService.navigatorKey.currentState!.pushReplacement(CupertinoPageRoute(builder: (context) => const FeedScreen()));
    } else{
      debug(data: "Login Failed");
    }
  }

  void togglePasswordVisibility() {
    state = state.update(passwordVisible: !state.passwordVisible);
  }

}