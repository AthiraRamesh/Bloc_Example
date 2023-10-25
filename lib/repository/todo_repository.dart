import 'dart:convert';
import 'package:bloc_example/models/todo.dart';
import 'package:http/http.dart' as http;

class TodoRepository {
  Future<List<Todo>> getAll() async {
    //const url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
    const url = 'https://jsonplaceholder.typicode.com/todos';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final result = json.map((e) {
        return Todo(
          /* id: e['id'],
            title: e['title'],
            description: e['description'],
              is_completed: e['is_completed']);*/
          id: e['id'],
          userId: e['userId'],
          title: e['title'],
          //completed: e['is_completed']
        );
      }).toList();
      return result;
    } else {
      throw "Something went wrong code ${response.statusCode}";
    }
  }
}

// class TodoRepository {
//   Future<void> getAll() async {
//     const url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
//     //const url = 'https://jsonplaceholder.typicode.com/todos';
//     final uri = Uri.parse(url);
//     final response = await http.get(uri);
//     if (response.statusCode == 200) {
//       final json = jsonDecode(response.body) as Map;
//       final result = json['items'] as List;
//       return result;
//     } else {
//       throw "Something went wrong code ${response.statusCode}";
//     }
//   }
// }
