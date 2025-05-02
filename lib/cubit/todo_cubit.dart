import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/models/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]) {
    _loadTodos();
  }

  void addTodo(Todo todo) {
    if (todo.data.isEmpty) {
      emitError("Task is empty.");
      return;
    }

    emit([...state, todo]);
    _saveTodos();
  }

  void removeTodo(Todo todo) {
    emit(state.where((e) => e != todo).toList());
  }

  void emitError(String message) {
    if (kDebugMode) {
      print(message);
    }
  }

  Future<void> _saveTodos() async {
    final todosJson = jsonEncode(state.map((e) => e.toJson()).toList());
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('todos', todosJson);
  }

  Future<void> _loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final todosJson = prefs.getString('todos');
    if (todosJson != null) {
      final List<dynamic> todosList = jsonDecode(todosJson);
      final todos = todosList.map((e) => Todo.fromJson(e)).toList();
      emit(todos);
    }
  }
}
