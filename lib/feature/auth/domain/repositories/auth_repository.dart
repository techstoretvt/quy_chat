import 'package:quy_chat/feature/auth/domain/entities/user_entity.dart';

abstract class IAuthRepository {
  Future<UserEntity> signUp(
      {required String username, required String password});
}
