import 'package:equatable/equatable.dart';

import '../../../../../repository/models/user.dart';

enum AllUserStatus { initial, success, loading, error }

extension AllUserStatusX on AllUserStatus {
  bool get isInitial => this == AllUserStatus.initial;

  bool get isSuccess => this == AllUserStatus.success;

  bool get isILoading => this == AllUserStatus.loading;

  bool get isError => this == AllUserStatus.error;
}

class AllUserState extends Equatable {
  final List<User> users;
  final AllUserStatus status;

  AllUserState({List<User>? users, this.status = AllUserStatus.loading})
      : users = users ?? [];

  @override
  List<Object?> get props => [];

  AllUserState copyWith({List<User>? users, AllUserStatus? status}) {
    return AllUserState(
        users: users ?? this.users, status: status ?? this.status);
  }
}
