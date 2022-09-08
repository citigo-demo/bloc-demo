import 'package:bloc_demo/ui/home/widgets/category_widget/bloc/category_bloc.dart';
import 'package:bloc_demo/ui/home/widgets/category_widget/categories_success_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/category_state.dart';

class CategoriesWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      buildWhen: (previous, current) => current.status.isSuccess,
      builder: (context, state){
        return CategoriesSuccessWidget();
      },
    );
  }
}