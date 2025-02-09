import 'package:quy_chat/feature/auth/domain/entities/user_entity.dart';
import 'package:quy_chat/feature/auth/domain/repositories/auth_repository.dart';

class SignUpUseCase {
  final IAuthRepository authRepository;

  SignUpUseCase(this.authRepository);

  Future<UserEntity> execute({
    required String username,
    required String password,
  }) async {
    return await authRepository.signUp(username: username, password: password);
  }
}
