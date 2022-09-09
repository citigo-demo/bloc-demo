import 'package:bloc_demo/ui/home/widgets/add_user_widget/user_item.dart';
import 'package:flutter/cupertino.dart';

import '../../../../repository/models/user.dart';

class AllUserSuccessWidget extends StatelessWidget {
  final List<User> users;

  AllUserSuccessWidget({required this.users});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('All users'),
        ListView.builder(itemBuilder: (context, index) {
          return UserItem(user: users[index]);
        })
      ],
    );
  }
}
