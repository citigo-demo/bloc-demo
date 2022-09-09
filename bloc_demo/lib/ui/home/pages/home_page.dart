import 'package:bloc_demo/repository/game_repository.dart';
import 'package:bloc_demo/repository/service/game_service.dart';
import 'package:bloc_demo/repository/user_repo/user_repo.dart';
import 'package:bloc_demo/repository/user_repo/user_repo_impl.dart';
import 'package:bloc_demo/ui/home/pages/home_layout.dart';
import 'package:bloc_demo/ui/home/widgets/add_number_widget/add_number_widget.dart';
import 'package:bloc_demo/ui/home/widgets/add_user_widget/all_users_widget.dart';
import 'package:bloc_demo/ui/home/widgets/all_games_widget/bloc/all_game_bloc.dart';
import 'package:bloc_demo/ui/home/widgets/all_games_widget/bloc/all_games_event.dart';
import 'package:bloc_demo/ui/home/widgets/category_widget/bloc/category_bloc.dart';
import 'package:bloc_demo/ui/home/widgets/category_widget/bloc/category_event.dart';
import 'package:bloc_demo/ui/home/widgets/games_by_category_widget/bloc/games_by_category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/add_user_widget/bloc/all_user_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    MultiBlocProvider(
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
    Text('page 1'),
    Text('page 2'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepositoryProvider(
          create: (context) => GameRepository(gameService: GameService()),
          child: _pages.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.games), label: 'Games'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add number'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
