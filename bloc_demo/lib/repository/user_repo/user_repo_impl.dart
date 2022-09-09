import 'package:bloc_demo/repository/models/user.dart';
import 'package:bloc_demo/repository/user_repo/user_repo.dart';

class UserRepoImpl with UserRepo {
  @override
  List<User> getUsers() {
    List<User> users = [
      User(
          userId: 1,
          userName: "VangThao 1",
          avatar: '',
          createdDate: DateTime.now()),
      User(
          userId: 2,
          userName: "VangThao 2",
          avatar: '',
          createdDate: DateTime.now()),
      User(
          userId: 3,
          userName: "VangThao 3",
          avatar: '',
          createdDate: DateTime.now())
    ];
    return users;
  }
}
