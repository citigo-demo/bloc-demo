import 'package:bloc_demo/repository/game_repository.dart';
import 'package:bloc_demo/ui/home/widgets/category_widget/bloc/category_event.dart';
import 'package:bloc_demo/ui/home/widgets/category_widget/bloc/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GameRepository gameRepository;

  CategoryBloc({required this.gameRepository}) : super(CategoryState()) {
    on<GetCategories>(_mapGetCategoriesEventToState);
    on<SelectCategory>(_mapSelectCategoryEventToState);
  }

  void _mapGetCategoriesEventToState(
      GetCategories event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(status: CategoryStatus.loading));

    try {
      final genres = await gameRepository.getGenres();

      emit(state.copyWith(status: CategoryStatus.success, categories: genres));
    } catch (error, stackTrace) {
      print(stackTrace);
      emit(state.copyWith(status: CategoryStatus.error));
    }
  }

  void _mapSelectCategoryEventToState(
      SelectCategory event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(
        status: CategoryStatus.selected, idSelected: event.idSelected));
  }
}
