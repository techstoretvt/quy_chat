import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quy_chat/core/errors/exceptions.dart';
import 'package:quy_chat/feature/auth/domain/entities/user_entity.dart';
import 'package:quy_chat/feature/auth/domain/usecases/sign_up.dart';
import 'package:quy_chat/feature/auth/presentasion/bloc/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignUpUseCase signUpUseCase;

  AuthCubit(this.signUpUseCase) : super(AuthInitialState());

  void increment(String a) {
    emit(AuthloadingState());
  }

  void signUp({required String username, required String password}) async {
    emit(AuthloadingState());
    // call usecase
    try {
      UserEntity user =
          await signUpUseCase.execute(username: username, password: password);
      if (user.id != null) {
        emit(AuthSuccessState(userEntity: user));
      }
    } catch (e) {
      if (e is ConflictException) {
        emit(AuthErrorState(message: e.message));
      }
    }
  }
}
