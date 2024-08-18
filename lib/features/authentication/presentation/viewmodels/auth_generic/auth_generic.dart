import 'package:social_feed_task/features/authentication/domain/entities/user.dart';

class AuthGeneric{
  final User? user;
  final bool isLoading;
  final bool error;
  final bool passwordVisible;
  final bool toggleRememberMe;

  AuthGeneric({
    this.user,
    this.isLoading = false,
    this.error = false,
    this.passwordVisible = false,
    this.toggleRememberMe = false,
  });

  AuthGeneric update({User? user, bool? error, bool? isLoading, bool? passwordVisible, bool? toggleRememberMe}){
    return AuthGeneric(
      user: user ?? this.user,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      passwordVisible: passwordVisible ?? this.passwordVisible,
      toggleRememberMe: toggleRememberMe ?? this.toggleRememberMe,
    );

  }
}