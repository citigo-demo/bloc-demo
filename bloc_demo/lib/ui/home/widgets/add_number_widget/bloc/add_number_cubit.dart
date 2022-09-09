import 'package:flutter_bloc/flutter_bloc.dart';

class AddNumberCubit extends Cubit<int> {
  AddNumberCubit(super.initialState);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);
}
