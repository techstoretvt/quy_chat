import 'dart:convert';

import 'package:quy_chat/core/constants/api_constants.dart';
import 'package:quy_chat/feature/auth/data/datasources/remote/auth/auth_remote_datasource.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasourceImpl implements AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDatasourceImpl(this.client);

  @override
  Future<void> signUp() async {
    // TODO: implement signUp
    final url = Uri.parse('${ApiConstants.baseUrl}/users');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      print('Data: $data');
    } else {
      print('Failed to fetch data: ${response.statusCode}');
    }
  }
}
