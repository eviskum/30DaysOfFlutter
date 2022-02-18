import './cubit/todo_cubit.dart';
import './loading_view.dart';
import './models/Todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodosView extends StatefulWidget {
  const TodosView({Key? key}) : super(key: key);

  @override
  State<TodosView> createState() => _TodosViewState();
}

class _TodosViewState extends State<TodosView> {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      floatingActionButton: _floatingActionButton(context),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state is ListTodosSuccess) {
            return state.todos.isEmpty ? _emptyTodosView() : _todosListView(state.todos);
          } else if (state is ListTodosFailure) {
            return _exceptionView(state.exception);
          } else {
            return LoadingView();
          }
          // return _emptyTodosView();
        },
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text('ToDos'),
    );
  }

  Widget _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(context: context, builder: (context) => _newTodoView());
          print('add new todo');
        });
  }

  Widget _newTodoView() {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(hintText: 'Enter todo title'),
          controller: _titleController,
        ),
        ElevatedButton(
            onPressed: () {
              BlocProvider.of<TodoCubit>(context).createTodo(_titleController.text);
              _titleController.clear();
              Navigator.of(context).pop();
            },
            child: Text('Save Todo')),
      ],
    );
  }

  Widget _emptyTodosView() {
    return Center(
      child: Text('No todos yet'),
    );
  }

  Widget _exceptionView(Exception exception) {
    return Center(
      child: Text(exception.toString()),
    );
  }

  Widget _todosListView(List<Todo> todos) {
    return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return Card(
            child: CheckboxListTile(
                title: Text(todo.title),
                value: todo.isComplete,
                onChanged: (newValue) {
                  BlocProvider.of<TodoCubit>(context).updateTodoIsComplete(todo, newValue ?? false);
                }),
          );
        });
  }
}



// final item = Todo(
// 		title: "Lorem ipsum dolor sit amet",
// 		isComplete: true);
// await Amplify.DataStore.save(item);

// final updatedItem = item.copyWith(
// 		title: "Lorem ipsum dolor sit amet",
// 		isComplete: true);
// await Amplify.DataStore.save(updatedItem);

// await Amplify.DataStore.delete(toDeleteItem);

// try {
//   List<Todo> Todos = await Amplify.DataStore.query(Todo.classType);
// } catch (e) {
//   print("Could not query DataStore: " + e);
// }
