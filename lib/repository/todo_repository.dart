import 'dart:convert';
import 'package:http/http.dart' as http;

class TodoRepository {
  Future<dynamic> getAll() async {
    const url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['items'] as List;
    }
  }
}
