class UserEntity {
  final String? id;
  final String? fullName;
  final String? email;
  final String? username;
  final String? avatar;
  final String? provider;
  final String? role;
  final bool? isOnline;
  final List<SettingEntity>? settings;
  final List<String>? friends;

  UserEntity({
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
}

class SettingEntity {
  final String? name;
  final String? value;

  SettingEntity({
    this.name,
    this.value,
  });
}
