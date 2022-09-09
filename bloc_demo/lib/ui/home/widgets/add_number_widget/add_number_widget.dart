import 'package:bloc_demo/ui/home/widgets/add_number_widget/bloc/add_number_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNumberWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider(
            create: (_) => AddNumberCubit(0),
            child: BlocBuilder<AddNumberCubit, int>(builder: (context, count) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        context.read<AddNumberCubit>().increment();
                      },
                      child: Text(
                        'Add',
                        style: TextStyle(fontSize: 12.0),
                      )),
                  SizedBox(
                    width: 16.0,
                  ),
                  Text('Result:$count'),
                  SizedBox(
                    width: 16.0,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.read<AddNumberCubit>().decrement();
                      },
                      child: Text(
                        'Decrement',
                        style: TextStyle(fontSize: 12.0),
                      )),
                ],
              );
            })),
      )
    );
  }
}
