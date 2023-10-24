import 'package:bloc_example/todo/cubit/todo_cubit.dart';
import 'package:bloc_example/todo/cubit/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubit API call"),
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          return Text(state.toString());
        },
      ),
    );
  }
}
