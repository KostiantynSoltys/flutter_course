import 'package:flutter/material.dart';
import 'package:flutter_course/homework/lesson12/presentation/widgets/new_task.dart';
import 'package:flutter_course/homework/lesson12/presentation/widgets/tasks_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  void _openAddTaskOverlay() {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewTask(onAddTask: _addTask));
  }

  void _addTask(Map task) {
    setState(() {
      Future addTask(task) async {
        await FirebaseFirestore.instance.collection('tasks').add({...task});
      }

      addTask(task);
    });
  }

  onChangeStatus(data, value) {
    setState(() {
      Future<void> changeStatus(data) async {
        Future.delayed(const Duration(milliseconds: 500)).then((_) {
          FirebaseFirestore.instance
              .collection('tasks')
              .doc(data.id)
              .update({'status': value});
        });
      }

      changeStatus(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Homeworks',
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: _openAddTaskOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: streamBuilder(context, onChangeStatus),
    );
  }
}
