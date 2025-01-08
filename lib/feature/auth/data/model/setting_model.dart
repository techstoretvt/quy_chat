import 'package:quy_chat/feature/auth/domain/entities/user_entity.dart';

class SettingModel {
  final String name;
  final String value;

  SettingModel({
    required this.name,
    required this.value,
  });

  // Parse từ JSON
  factory SettingModel.fromJson(Map<String, dynamic> json) {
    return SettingModel(
      name: json['name'],
      value: json['value'],
    );
  }

  // Chuyển thành Entity
  SettingEntity toEntity() {
    return SettingEntity(
      name: name,
      value: value,
    );
  }
}
