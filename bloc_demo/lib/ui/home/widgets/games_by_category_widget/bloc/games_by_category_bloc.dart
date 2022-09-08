import 'package:bloc_demo/repository/game_repository.dart';
import 'package:bloc_demo/ui/home/widgets/games_by_category_widget/bloc/games_by_category_event.dart';
import 'package:bloc_demo/ui/home/widgets/games_by_category_widget/bloc/games_by_category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GamesByCategoryBloc
    extends Bloc<GamesByCategoryEvent, GamesByCategoryState> {
  final GameRepository gameRepository;

  GamesByCategoryBloc({required this.gameRepository})
      : super(GamesByCategoryState()) {
    on<GetGamesByCategory>(_mapGetGamesByCategoryEventToState);
  }

  void _mapGetGamesByCategoryEventToState(
      GetGamesByCategory event, Emitter<GamesByCategoryState> emit) async {
    try {
      emit(state.copyWith(status: GamesByCategoryStatus.loading));

      final gamesByCategory =
          await gameRepository.getGamesByCategory(event.idSelected);

      emit(state.copyWith(
          status: GamesByCategoryStatus.success,
          games: gamesByCategory,
          categoryName: event.categoryName));
    } catch (error, stackTrace) {
      print(stackTrace);
      emit(state.copyWith(status: GamesByCategoryStatus.error));
    }
  }
}
