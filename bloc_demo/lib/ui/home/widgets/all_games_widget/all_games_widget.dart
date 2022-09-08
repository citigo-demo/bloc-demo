import 'package:bloc_demo/ui/home/widgets/all_games_widget/all_games_success_widget.dart';
import 'package:bloc_demo/ui/home/widgets/all_games_widget/bloc/all_game_bloc.dart';
import 'package:bloc_demo/ui/home/widgets/all_games_widget/bloc/all_games_state.dart';
import 'package:bloc_demo/ui/widgets/error_game_wiget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllGameWidget extends StatelessWidget {
  final String title;

  AllGameWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllGamesBloc, AllGamesState>(builder: (context, state) {
      return state.status.isSuccess
          ? AllGamesSuccessWidget(
              title: title,
              games: state.games.results,
            )
          : state.status.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : state.status.isError
                  ? ErrorGameWidget()
                  : const SizedBox();
    });
  }
}
