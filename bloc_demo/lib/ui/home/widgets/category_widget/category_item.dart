import 'package:bloc_demo/repository/models/genre.dart';
import 'package:bloc_demo/ui/home/widgets/category_widget/bloc/category_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/category_state.dart';

typedef CategoryClicked = Function(Genre categorySelected);

class CategoryItem extends StatelessWidget {
  final Genre category;
  final CategoryClicked callback;

  CategoryItem({Key? key, required this.category, required this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callback(category),
      child: BlocSelector<CategoryBloc, CategoryState, bool>(
        selector: (state) =>
            (state.status.isSelected && state.idSelected == category.id),
        builder: (context, state) {
          return Column(
            children: [
              AnimatedContainer(
                duration: Duration(microseconds: 400),
                curve: Curves.easeInOutCirc,
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                alignment: Alignment.center,
                height: state ? 70.0 : 60.0,
                width: state ? 70.0 : 60.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        state ? Colors.deepOrangeAccent : Colors.amberAccent),
                child: Icon(Icons.gamepad_outlined),
              ),
              SizedBox(
                height: 4.0,
              ),
              Container(
                width: 60,
                child: Text(
                  category.name ?? '',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0,
                      color: Colors.black87),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
