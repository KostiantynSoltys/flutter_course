import 'package:flutter/material.dart';
import 'package:flutter_course/homework/lesson12/presentation/widgets/'
    'inherited_widget.dart';
import 'package:flutter_course/homework/lesson12/presentation/widgets/'
    'new_task.dart';
import 'package:flutter_course/homework/lesson12/presentation/widgets/'
    'tasks_list.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool? isNetworkAvailable =
        InheritedCheckConnection.of(context)?.isNetworkAvailable;

    void openAddTaskOverlay() {
      showModalBottomSheet(
          useSafeArea: true,
          isScrollControlled: true,
          context: context,
          builder: (ctx) => const NewTask());
    }

    if (isNetworkAvailable == true) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Homeworks',
            style: TextStyle(fontSize: 22),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: openAddTaskOverlay, icon: const Icon(Icons.add))
          ],
        ),
        body: streamBuilder(context),
      );
    } else {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'No internet connection',
            style: TextStyle(fontSize: 28),
          ),
        ],
      );
    }
  }
}
