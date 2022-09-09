import 'package:bloc_demo/ui/home/widgets/add_user_widget/all_user_success_widget.dart';
import 'package:bloc_demo/ui/home/widgets/add_user_widget/bloc/all_user_bloc.dart';
import 'package:bloc_demo/ui/home/widgets/add_user_widget/bloc/all_user_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/error_game_wiget.dart';

class AllUserWidget extends StatelessWidget {
  AllUserWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AllUserBloc, AllUserState>(
        builder: (context, state) {
          return state.status.isSuccess
              ? AllUserSuccessWidget(users: state.users)
              : state.status.isILoading
                  ? const Center(child: CircularProgressIndicator())
                  : state.status.isError
                      ? CommonErrorWidget()
                      : const SizedBox();
        },
      ),
    );
  }
}
