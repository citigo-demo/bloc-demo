import 'package:bloc_demo/repository/models/genre.dart';
import 'package:bloc_demo/repository/models/result.dart';
import 'package:bloc_demo/repository/service/game_service.dart';

import 'models/game.dart';

class GameRepository {
  final GameService gameService;

  GameRepository({required this.gameService});

  Future<Game> getGames() => gameService.getGames();

  Future<List<Genre>> getGenres() => gameService.getGenres();

  Future<List<Result>> getGamesByCategory(int genreId) =>
      gameService.getGameByCategory(genreId);
}
