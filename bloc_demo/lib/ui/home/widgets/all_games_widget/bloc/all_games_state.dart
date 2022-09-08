import 'package:equatable/equatable.dart';

import '../../../../../repository/models/game.dart';

enum AllGamesStatus { initial, success, error, loading }

extension AllGamesStatusX on AllGamesStatus {
  bool get isInitial => this == AllGamesStatus.initial;

  bool get isSuccess => this == AllGamesStatus.success;

  bool get isError => this == AllGamesStatus.error;

  bool get isLoading => this == AllGamesStatus.loading;
}

class AllGamesState extends Equatable {
  final Game games;
  final AllGamesStatus status;

  AllGamesState({Game? games, this.status = AllGamesStatus.initial})
      : games = games ?? Game.empty;

  @override
  List<Object?> get props => [status, games];

  AllGamesState copyWith({Game? games, AllGamesStatus? status}) {
    return AllGamesState(
        games: games ?? this.games, status: status ?? this.status);
  }
}
