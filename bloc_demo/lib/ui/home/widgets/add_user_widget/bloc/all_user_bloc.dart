import 'package:bloc_demo/ui/home/widgets/add_user_widget/bloc/all_user_event.dart';
import 'package:bloc_demo/ui/home/widgets/add_user_widget/bloc/all_user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../repository/user_repo/user_repo_impl.dart';

class AllUserBloc extends Bloc<AllUserEvent, AllUserState> {
  final UserRepoImpl userRepo;

  AllUserBloc({required this.userRepo}) : super(AllUserState()) {
    on<GetUsers>(_mapAllUsersToState);
  }

  void _mapAllUsersToState(GetUsers event, Emitter<AllUserState> emit) async {
    try {
      emit(state.copyWith(status: AllUserStatus.loading));
      final users = userRepo.getUsers();
      emit(state.copyWith(status: AllUserStatus.success, users: users));
    } catch (error) {
      emit(state.copyWith(status: AllUserStatus.error));
    }
  }
}
