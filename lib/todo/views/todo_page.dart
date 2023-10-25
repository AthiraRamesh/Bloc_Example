import 'package:bloc_example/todo/cubit/todo_cubit.dart';
import 'package:bloc_example/todo/cubit/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<TodoCubit>();
      cubit.fetchTodo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("ToDo List")),
        backgroundColor: Colors.blue[900],
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<TodoCubit, TodoState>(
              builder: (context, state) {
                if (state is InitTodoState || state is LoadingTodoState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ResponseTodoState) {
                  final todos = state.todos;
                  return Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 50.0),
                    child: ListView.separated(
                      itemCount: todos.length,
                      separatorBuilder: (context, index) => Divider(),
                      itemBuilder: (context, index) {
                        final todo = todos[index];
                        return Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Color.fromARGB(255, 216, 214, 214),
                              ),
                              child: ListTile(
                                leading:
                                    CircleAvatar(child: Text('${index + 1}')),
                                title: Text(todo.title),
                                // subtitle: Text(todo.description),
                                trailing: PopupMenuButton(onSelected: (value) {
                                  if (value == 'edit') {
                                    //open the edit page
                                    //navigateToEditPage(item);
                                  } else if (value == 'delete') {
                                    // delete and remove the item
                                    //deleteById(id);
                                  }
                                }, itemBuilder: (context) {
                                  return [
                                    const PopupMenuItem(
                                      value: 'edit',
                                      child: Text('Edit'),
                                    ),
                                    const PopupMenuItem(
                                      value: 'delete',
                                      child: Text('Delete'),
                                    )
                                  ];
                                }),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                } else if (state is ErrorTodoState) {
                  return Text(state.message);
                }
                return Center(child: Text(state.toString()));
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}
