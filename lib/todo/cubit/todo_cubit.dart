import 'package:bloc_example/repository/todo_repository.dart';
import 'package:bloc_example/todo/cubit/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoRepository _repository;
  TodoCubit(this._repository) : super(InitTodoState());

  Future<void> fetchTodo() async {
    emit(LoadingTodoState());
    final response = await _repository.getAll();
    emit(ResponseTodoState(response));
  }
}
