import 'package:flutter/material.dart';
import 'package:hello_world/components/create_task_dialog.dart';
import 'package:hello_world/components/todo_box.dart';

class TodoAppPage extends StatefulWidget {
  const TodoAppPage({super.key});

  @override
  State<TodoAppPage> createState() => _TodoAppPageState();
}

class _TodoAppPageState extends State<TodoAppPage> {
  final List<Map<String, dynamic>> todoList = [
    {'name': "Đá bóng", 'isCompleted': false},
    {'name': "Đi tắm", 'isCompleted': true},
    {'name': "Học bài", 'isCompleted': false},
  ];
  final controller = TextEditingController();
  void onChangeBox(bool? value, int index) {
    setState(() {
      todoList[index]['isCompleted'] = value;
    });
  }

  void createNewTask() {
    setState(() {
      todoList.add(
        {'name': controller.text, 'isCompleted': false},
      );
    });
    controller.text = "";
  }

  void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  void openDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return CreateTaskDialog(
              onSave: createNewTask, controller: controller);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 151, 204, 152),
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text("Todo app"),
      ),
      body: ListView.builder(
          itemCount: todoList.length, // Ensure the number of items is set
          itemBuilder: (context, index) {
            return TodoBox(
                deleteTaskFunc: (context) => deleteTask(index),
                name: todoList[index]['name'],
                onChanged: (bool? value) => onChangeBox(value, index),
                isCompleted: todoList[index]['isCompleted']);

          }),
      floatingActionButton: FloatingActionButton(
        onPressed: openDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
