import 'package:flutter/material.dart';

class CreateTaskDialog extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  const CreateTaskDialog(
      {super.key, required this.onSave, required this.controller});

  @override
  State<CreateTaskDialog> createState() => _CreateTaskDialogState();
}

class _CreateTaskDialogState extends State<CreateTaskDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.yellow,
      child: Container(
        height: 300,
        child: Column(
          children: [
             TextField(
              controller: widget.controller,
              decoration: const InputDecoration(
                labelText: 'Task Name',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                widget.onSave();
                // Add task to the list
                Navigator.pop(context);
              },
              child: const Text('Create Task'),
            ),
          ],
        ),
      ),
    );
  }
}


