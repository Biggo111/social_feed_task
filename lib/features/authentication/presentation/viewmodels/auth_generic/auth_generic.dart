import 'package:social_feed_task/features/authentication/domain/entities/user.dart';

class AuthGeneric{
  final User? user;
  final bool isLoading;
  final bool? error;

  AuthGeneric({
    this.user,
    this.isLoading = false,
    this.error,
  });

  AuthGeneric update({User? user, bool? error, bool? isLoading}){
    return AuthGeneric(
      user: user ?? this.user,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );

  }
}