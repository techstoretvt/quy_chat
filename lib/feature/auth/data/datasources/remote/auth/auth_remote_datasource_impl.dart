import 'dart:convert';

import 'package:quy_chat/core/constants/api_constants.dart';
import 'package:quy_chat/core/errors/exceptions.dart';
import 'package:quy_chat/feature/auth/data/datasources/remote/auth/auth_remote_datasource.dart';
import 'package:http/http.dart' as http;
import 'package:quy_chat/feature/auth/data/model/user_model.dart';
import 'package:quy_chat/feature/auth/domain/entities/user_entity.dart';

class AuthRemoteDatasourceImpl implements IAuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDatasourceImpl(this.client);

  @override
  Future<UserEntity> signUp({required username, required password}) async {
    try {
      final url = Uri.parse('${ApiConstants.baseUrl}/auth/signup');
      var body = {
        "username": username,
        "password": password,
      };
      final response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode(body));

      Map<String, dynamic> data = json.decode(response.body);

      if (data["status"] == 201) {
        UserEntity user = UserModel.fromJson(data["data"]).toEntity();
        print(user.fullName);
        return user;
      } else if (data["status"] == 409) {
        throw ConflictException("Tài khoản đã tồn tại");
      }
    } catch (e) {
      if (e is ConflictException) rethrow;
    }

    return UserEntity();
  }
}
