import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  final int? userId;
  final String? userName;
  final String? avatar;
  final DateTime? createdDate;

  User(
      {required this.userId,
      required this.userName,
      required this.avatar,
      required this.createdDate});

  static User empty =
      User(userId: 0, userName: '', avatar: '', createdDate: DateTime.now());

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
