import 'package:bloc_example/models/todo.dart';

abstract class TodoState {}

class InitTodoState extends TodoState {}

class LoadingTodoState extends TodoState {}

class ErrorTodoState extends TodoState {}

class ResponseTodoState extends TodoState {
  final List<Todo> todos;
  ResponseTodoState(this.todos);
}
