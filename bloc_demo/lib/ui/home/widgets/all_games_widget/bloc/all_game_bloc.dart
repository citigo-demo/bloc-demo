import 'package:bloc_demo/repository/game_repository.dart';
import 'package:bloc_demo/ui/home/widgets/all_games_widget/bloc/all_games_event.dart';
import 'package:bloc_demo/ui/home/widgets/all_games_widget/bloc/all_games_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllGamesBloc extends Bloc<AllGamesEvent, AllGamesState> {
  final GameRepository gameRepository;

  AllGamesBloc({required this.gameRepository}) : super(AllGamesState()) {
    on<GetGames>(_mapGetGameEventToState);
  }

  void _mapGetGameEventToState(
      GetGames event, Emitter<AllGamesState> emit) async {
    try {
      emit(state.copyWith(status: AllGamesStatus.loading));
      final games = await gameRepository.getGames();

      emit(
        state.copyWith(status: AllGamesStatus.success, games: games),
      );
    } catch (error) {
      emit(state.copyWith(status: AllGamesStatus.error));
    }
  }
}
