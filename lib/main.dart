import 'package:bloc_example/repository/todo_repository.dart';
import 'package:bloc_example/todo/cubit/todo_cubit.dart';
import 'package:bloc_example/todo/views/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TodoCubit(TodoRepository()),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: TodoPage(),
        ));
  }
}
