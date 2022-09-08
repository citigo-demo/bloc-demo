import 'package:bloc_demo/ui/home/widgets/all_games_widget/all_game_item_button.dart';
import 'package:bloc_demo/ui/home/widgets/all_games_widget/all_game_item_image.dart';
import 'package:bloc_demo/ui/home/widgets/all_games_widget/all_games_item_rating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../repository/models/result.dart';

class AllGamesItem extends StatelessWidget {
  final Result game;

  AllGamesItem({required this.game});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.grey.withOpacity(0.1)),
      child: Stack(
        children: [
          Positioned(
              left: 20.0,
              top: 15.0,
              bottom: 15.0,
              child: AllGamesItemImage(
                backgroundImage: game.backgroundImage ?? '',
              )),
          Positioned(
              top: 25.0,
              left: 100.0,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  game.name ?? '',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                  overflow: TextOverflow.ellipsis,
                ),
              )),
          Positioned(
            left: 100.0,
              top: 45.0,
              child: Text(
                game.genres?.first.name??'',
                style: TextStyle(
                  fontSize: 12.0
                ),
              )),
          Positioned(
              left: 65.0,
              top: 100.0,
              child:AllGameItemRating(
                rating: game.rating??0.0,
              )),
          Positioned(
              left: 20.0,
              top: 10.0,
              child:AllGameItemButton(
                callback: (){
                  print('item name -->${game.name}');
                },
              )),
        ],
      ),
    );
  }
}
