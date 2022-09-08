import 'package:bloc_demo/ui/home/widgets/games_by_category_widget/games_by_category_image.dart';
import 'package:flutter/cupertino.dart';

import '../../../../repository/models/result.dart';

class GamesByCategorySuccessWidget extends StatelessWidget {
  final String categoryName;
  final List<Result> games;

  GamesByCategorySuccessWidget(
      {required this.categoryName, required this.games});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 24.0, bottom: 16.0),
          child: Text(
            categoryName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          child: ListView.separated(
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GamesByCategoryImage(
                    name: games[index].name ?? 'No data',
                    backgroundImage: games[index].backgroundImage ?? '');
              },
              separatorBuilder: (_, __) => SizedBox(
                    width: 25.0,
                  ),
              itemCount: games.length),
        )
      ],
    );
  }
}
