import 'package:quy_chat/feature/auth/data/datasources/remote/auth/auth_remote_datasource.dart';
import 'package:quy_chat/feature/auth/domain/entities/user_entity.dart';
import 'package:quy_chat/feature/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final IAuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<UserEntity> signUp(
      {required String username, required String password}) async {
    return await authRemoteDataSource.signUp(
        username: username, password: password);
  }
}
