import 'package:bloc_example/todo/cubit/todo_cubit.dart';
import 'package:bloc_example/todo/cubit/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubit API call"),
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state is InitTodoState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Text(state.toString());
        },
      ),
    );
  }
}
