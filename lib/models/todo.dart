import 'package:flutter/material.dart';

class Todo {
  final int id;
  final String title;
  final String description;
  final bool is_completed;
  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.is_completed,
  });
}
