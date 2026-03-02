import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/config/config.dart';
import 'package:riverpod_app/domain/domain.dart';
import 'package:uuid/uuid.dart';

part 'todo_provider.g.dart';

const uuid = Uuid();

enum FilterType { all, completed, pending }

@Riverpod(keepAlive: true)
class TodoCurrentFilter extends _$TodoCurrentFilter {
  @override
  FilterType build() => FilterType.all;

  void changeCurrentFilter(FilterType newfilter) {
    state = newfilter;
  }
}

@Riverpod(keepAlive: true)
class Todos extends _$Todos {
  @override
  List<Todo> build() {
    return [
      Todo(
          id: uuid.v4(),
          description: RandomGenerator.getRandomName(),
          completedAt: null),
      Todo(
          id: uuid.v4(),
          description: RandomGenerator.getRandomName(),
          completedAt: DateTime.now()),
      Todo(
          id: uuid.v4(),
          description: RandomGenerator.getRandomName(),
          completedAt: null),
      Todo(
          id: uuid.v4(),
          description: RandomGenerator.getRandomName(),
          completedAt: DateTime.now()),
      Todo(
          id: uuid.v4(),
          description: RandomGenerator.getRandomName(),
          completedAt: null),
    ];
  }

  void createTodo(String description) {
    state = [
      ...state,
      Todo(id: uuid.v4(), description: description, completedAt: null),
    ];
  }

  void toggleTodo(String id) {
    state = state.map((todo) {
      if (todo.id == id) {
        todo = todo.copyWith(completedAt: todo.done ? null : DateTime.now());
      }

      return todo;
    }).toList();
  }
}

@riverpod
List<Todo> filteredTodos(Ref ref) {
  final currentfilter = ref.watch(todoCurrentFilterProvider);
  final todos = ref.watch(todosProvider);

  switch (currentfilter) {
    case FilterType.all:
      return todos;

    case FilterType.completed:
      return todos.where((todo) => todo.done).toList();

    case FilterType.pending:
      return todos.where((todo) => !todo.done).toList();
  }
}
