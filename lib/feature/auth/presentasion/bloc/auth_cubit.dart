import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quy_chat/feature/auth/presentasion/bloc/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  void increment(String a) {
    emit(AuthloadingState());
  }
}
