import 'package:bloc_demo/repository/models/user.dart';

abstract class UserRepo {
  List<User> getUsers();
}
