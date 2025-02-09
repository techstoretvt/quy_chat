import 'package:get_it/get_it.dart';
import 'package:quy_chat/feature/auth/data/datasources/remote/auth/auth_remote_datasource.dart';
import 'package:quy_chat/feature/auth/data/datasources/remote/auth/auth_remote_datasource_impl.dart';
import 'package:quy_chat/feature/auth/data/repositories/auth_repository.dart';
import 'package:quy_chat/feature/auth/domain/repositories/auth_repository.dart';
import 'package:quy_chat/feature/auth/application/usecases/sign_up.dart';
import 'package:quy_chat/feature/auth/presentasion/bloc/auth_cubit.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

void init() {
  // Register Http Client
  getIt.registerLazySingleton(() => http.Client());

  // Register RemoteDataSource
  getIt.registerLazySingleton<IAuthRemoteDataSource>(
      () => AuthRemoteDatasourceImpl(getIt()));

  // Register Repository
  getIt.registerLazySingleton<IAuthRepository>(
      () => AuthRepositoryImpl(getIt()));

  // Register UseCase
  getIt.registerLazySingleton(() => SignUpUseCase(getIt()));

  // Register Cubit
  getIt.registerFactory(() => AuthCubit(getIt()));
}
