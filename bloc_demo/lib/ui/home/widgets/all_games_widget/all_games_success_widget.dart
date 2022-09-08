import 'package:flutter/cupertino.dart';

import '../../../../repository/models/result.dart';
import 'all_game_item.dart';

class AllGamesSuccessWidget extends StatelessWidget {
  final List<Result> games;
  final String title;

  AllGamesSuccessWidget({required this.games, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(padding: EdgeInsets.only(left: 24.0),
          child: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0
            ),
          ),),
        Container(
          height: ((100 * games.length) + MediaQuery
              .of(context)
              .size
              .width) + 24.0,
          child: ListView.separated(physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(
                  left: 24.0,
                  right: 24.0,
                  top: 24.0
              ),
              itemBuilder: (context, index) {
                return AllGamesItem(
                    game: games[index]
                );
              },
              separatorBuilder: (_, __) => SizedBox(height: 20.0,),
              itemCount: games.length),
        )
      ],
    );
  }
}