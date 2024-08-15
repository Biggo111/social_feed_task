import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:social_feed_task/core/network/api_client.dart';
import 'package:social_feed_task/core/network/mock_interceptor.dart';
import 'package:social_feed_task/core/network/network_info.dart';
import 'package:social_feed_task/features/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:social_feed_task/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:social_feed_task/features/authentication/domain/repositories/auth_repository.dart';
import 'package:social_feed_task/features/authentication/domain/usecases/login_use_case.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External dependencies
  sl.registerLazySingleton<Dio>(() => Dio()..interceptors.add(MockInterceptor()));

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  sl.registerLazySingleton<ApiClient>(() => ApiClient(sl()));
  
  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(sl()));

  // Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // // Use cases
  // sl.registerLazySingleton(() => LoginUseCase(sl()));
}
