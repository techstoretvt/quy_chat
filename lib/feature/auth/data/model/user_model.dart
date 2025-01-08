// ignore_for_file: non_constant_identifier_names

import 'package:quy_chat/feature/auth/data/model/setting_model.dart';
import 'package:quy_chat/feature/auth/domain/entities/user_entity.dart';

class UserModel {
  final String? id;
  final String? fullName;
  final String? email;
  final String? username;
  final String? avatar;
  final String? provider;
  final String? role;
  final bool? isOnline;
  final List<SettingModel>? settings;
  final List<String>? friends;

  UserModel({
    this.id,
    this.username,
    this.avatar,
    this.provider,
    this.role,
    this.isOnline,
    this.fullName,
    this.email,
    this.settings,
    this.friends,
  });

  // Parse từ JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      fullName: json['full_name'],
      email: json['email'],
      username: json['username'],
      avatar: json['avatar'],
      provider: json['auth']['provider'],
      role: json['role'],
      isOnline: json['is_online'],
      settings: (json['settings'] as List)
          .map((setting) => SettingModel.fromJson(setting))
          .toList(),
      friends: List<String>.from(json['friends'] ?? []),
    );
  }

  // Chuyển thành Entity
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      fullName: fullName,
      email: email,
      username: username,
      avatar: avatar,
      provider: provider,
      role: role,
      isOnline: isOnline,
      settings: settings?.map((s) => s.toEntity()).toList(),
      friends: friends,
    );
  }
}
