import 'package:quy_chat/feature/auth/domain/entities/user_entity.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthloadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final UserEntity userEntity;

  AuthSuccessState({required this.userEntity});
}

class AuthErrorState extends AuthState {
  final String message;

  AuthErrorState({required this.message});
}
