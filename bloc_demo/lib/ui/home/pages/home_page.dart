import 'package:bloc_demo/repository/game_repository.dart';
import 'package:bloc_demo/repository/service/game_service.dart';
import 'package:bloc_demo/ui/home/pages/home_layout.dart';
import 'package:bloc_demo/ui/home/widgets/all_games_widget/bloc/all_game_bloc.dart';
import 'package:bloc_demo/ui/home/widgets/all_games_widget/bloc/all_games_event.dart';
import 'package:bloc_demo/ui/home/widgets/category_widget/bloc/category_bloc.dart';
import 'package:bloc_demo/ui/home/widgets/category_widget/bloc/category_event.dart';
import 'package:bloc_demo/ui/home/widgets/games_by_category_widget/bloc/games_by_category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RepositoryProvider(
      create: (context) => GameRepository(gameService: GameService()),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AllGamesBloc>(
              create: (context) =>
                  AllGamesBloc(gameRepository: context.read<GameRepository>())
                    ..add(GetGames())),
          BlocProvider<CategoryBloc>(
              create: (context) =>
                  CategoryBloc(gameRepository: context.read<GameRepository>())
                    ..add(GetCategories())),
          BlocProvider<GamesByCategoryBloc>(
              create: (context) => GamesByCategoryBloc(
                  gameRepository: context.read<GameRepository>()))
        ],
        child: HomeLayout(),
      ),
    ));
  }
}
