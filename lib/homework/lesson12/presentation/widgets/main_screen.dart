import 'package:flutter/material.dart';
import 'package:flutter_course/homework/lesson12/presentation/widgets/'
    'new_task.dart';
import 'package:flutter_course/homework/lesson12/presentation/widgets/'
    'tasks_list.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void openAddTaskOverlay() {
      showModalBottomSheet(
          useSafeArea: true,
          isScrollControlled: true,
          context: context,
          builder: (ctx) => const NewTask());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Homeworks',
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: openAddTaskOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: streamBuilder(context),
    );
  }
}
