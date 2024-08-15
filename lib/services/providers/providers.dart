
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_feed_task/features/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:social_feed_task/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:social_feed_task/features/authentication/domain/repositories/auth_repository.dart';
import 'package:social_feed_task/features/authentication/domain/usecases/login_use_case.dart';
import 'package:social_feed_task/services/di/service_locator_di.dart';

final dioProvider = Provider<Dio>((ref) => sl<Dio>());

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>(
  (ref) => AuthRemoteDataSourceImpl(ref.read(dioProvider)),
);

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(ref.read(authRemoteDataSourceProvider)),
);

final loginUseCaseProvider = Provider<LoginUseCase>(
  (ref) => LoginUseCase(),
);
