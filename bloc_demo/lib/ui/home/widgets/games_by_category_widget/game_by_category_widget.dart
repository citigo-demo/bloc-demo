import 'package:bloc_demo/ui/home/widgets/games_by_category_widget/bloc/games_by_category_bloc.dart';
import 'package:bloc_demo/ui/home/widgets/games_by_category_widget/bloc/games_by_category_state.dart';
import 'package:bloc_demo/ui/home/widgets/games_by_category_widget/games_by_category_success_widget.dart';
import 'package:bloc_demo/ui/widgets/error_game_wiget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GamesByCategoryWidget extends StatelessWidget {

  GamesByCategoryWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GamesByCategoryBloc, GamesByCategoryState>(
        builder: (context, state) {
          return state.status.isSuccess ? GamesByCategorySuccessWidget(
              categoryName: state.categoryName, games: state.games) : state
              .status.isLoading
              ? const Center(child: CircularProgressIndicator(),)
              : state.status.isError ? ErrorGameWidget() : const SizedBox();
        });
  }
}