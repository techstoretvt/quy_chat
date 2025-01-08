import 'package:quy_chat/feature/auth/domain/entities/user_entity.dart';

abstract class IAuthRemoteDataSource {
  Future<UserEntity> signUp({required username, required password});
}
