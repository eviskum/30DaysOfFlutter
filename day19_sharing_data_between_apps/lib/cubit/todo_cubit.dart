import 'package:bloc/bloc.dart';
import '../models/Todo.dart';
import '../todo_repository.dart';
import 'package:meta/meta.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final _todoRepo = TodoRepository();

  TodoCubit() : super(TodoInitial());

  void getTodos() async {
    if (state is ListTodosSuccess == false) {
      emit(LoadingTodos());
    }

    try {
      final todos = await _todoRepo.getTodos();
      emit(ListTodosSuccess(todos: todos));
    } catch (e) {
      emit(ListTodosFailure(exception: e as Exception));
    }
  }

  void createTodo(String title) async {
    await _todoRepo.createTodo(title);
    // getTodos();
  }

  void updateTodoIsComplete(Todo todo, bool isComplete) async {
    await _todoRepo.updateTodoIsComplete(todo, isComplete);
    // getTodos();
  }

  void observeTodo() {
    final todosStream = _todoRepo.observeTodos();
    todosStream.listen((event) {
      getTodos();
    });
  }
}
