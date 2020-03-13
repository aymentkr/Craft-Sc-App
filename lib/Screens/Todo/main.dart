import 'package:flutter/material.dart';
import 'TodoListState.dart';
class Todo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  new TodoList();          //curves for bottom
  }
}
class TodoList extends StatefulWidget {
  @override
  createState() => new TodoListState();
}