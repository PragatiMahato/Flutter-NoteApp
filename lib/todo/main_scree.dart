import 'package:flutter/material.dart';
import 'package:note_provider/todo/todo_modal.dart';
import 'package:provider/provider.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  Widget appbartitle = Container(
      margin: const EdgeInsets.only(right: 270), child: const Text("ToDo App"));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 103, 58, 182),
        title: appbartitle,
      ),
      body: Consumer<TodoProvider>(builder: (context, todoProvider, child) {
        return GridView.builder(
            itemCount: todoProvider.todos.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
            ),
            itemBuilder: (context, index) {
              return SizedBox(
                height: 30,
                child: Column(
                  children: [
                    Row(
                      children: [
            //            ListTile(
            // title: DecoratedBox(
            //   decoration: todoProvider.todos[index].isDone
            //       ? BoxDecoration(
            //           decoration: TextDecoration.lineThrough,
            //           color: Colors.grey,
            //         )
            //       : null,
            //   child: Text(todoProvider.todos[index].task),
            // ),),
                        Checkbox(
                            value: todoProvider.todos[index].isDone,
                            onChanged: (value) {
                              todoProvider.toggleTodo(todoProvider.todos[index]);
                            }),
                        Container(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            todoProvider.todos[index].task,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        Container(
                            alignment: Alignment.topRight,
                            margin: const EdgeInsets.only(left: 150),
                            child: IconButton(
                                onPressed: () {
                                  todoProvider.removeNote(todoProvider.todos[index]);
                                },
                                icon: const Icon(Icons.delete)))
                      ],
                    )
                  ],
                ),
              );
            });
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  title: Text("Add a new Task"),
                  titleTextStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 21,
                      color: Color.fromARGB(255, 35, 35, 35)),
                  content: BtnSubmit(),
                );
              });
        },
        backgroundColor: const Color.fromARGB(255, 103, 58, 182),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class BtnSubmit extends StatefulWidget {
  const BtnSubmit({
    super.key,
  });
  @override
  State<BtnSubmit> createState() => _BtnSubmitState();
}

class _BtnSubmitState extends State<BtnSubmit> {
  final TextEditingController _todoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _todoController,
          decoration: const InputDecoration(
              hintText: "Add New Task",
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 103, 58, 182), width: 2.5))),
        ),
        Container(
            width: 130,
            margin: const EdgeInsets.only(top: 40),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 103, 58, 182),
                borderRadius: BorderRadius.circular(7)),
            child: TextButton(
                onPressed: () {
                  Todo todo = Todo(
                      task: _todoController.text,
                      id: DateTime.now().microsecondsSinceEpoch);
                  Provider.of<TodoProvider>(context, listen: false)
                      .addTodo(todo);
                  Navigator.pop(context);
                },
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                )))
      ],
    );
  }
}

