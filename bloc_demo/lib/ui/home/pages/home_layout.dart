import 'package:bloc_demo/ui/home/widgets/add_number_widget/add_number_widget.dart';
import 'package:bloc_demo/ui/home/widgets/all_games_widget/all_games_widget.dart';
import 'package:bloc_demo/ui/home/widgets/category_widget/categories_widget.dart';
import 'package:bloc_demo/ui/home/widgets/games_by_category_widget/game_by_category_widget.dart';
import 'package:bloc_demo/ui/home/widgets/header_title/header_title.dart';
import 'package:bloc_demo/ui/widgets/container_body.dart';
import 'package:flutter/cupertino.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 80.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitle(),
          const SizedBox(
            height: 40,
          ),
          ContainerBody(children: [
            CategoriesWidget(),
            GamesByCategoryWidget(),
            AllGameWidget(title: 'All games')
          ])
        ],
      ),
    );
  }
}
