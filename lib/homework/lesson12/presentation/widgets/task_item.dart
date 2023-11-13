import 'package:flutter/material.dart';
import 'package:flutter_course/homework/lesson12/controller/tasks_actions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Status { pending, inProgress, completed }

class TaskItem extends ConsumerWidget {
  TaskItem({super.key, required this.data, required this.number});

  final dynamic data;
  final int number;

  final taskNotifier = TasksActions();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextTheme textStyle = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 12,
                  child: Text(
                    number.toString(),
                    style: textStyle.titleSmall,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(data['title'], style: textStyle.titleLarge),
                )
              ],
            ),
            const SizedBox(height: 8),
            Text(data['description'], style: textStyle.titleMedium),
            Row(
              children: [
                Text('Deadline: ', style: textStyle.titleMedium),
                Text(data['deadline'], style: textStyle.titleMedium),
                const Spacer(),
                DropdownButton<Status>(
                  iconSize: 30,
                  iconEnabledColor: Theme.of(context).primaryColor,
                  dropdownColor: Theme.of(context).primaryColor,
                  value: Status.values
                      .firstWhere((element) => element.name == data['status']),
                  hint: Text(data['status'].toString().toUpperCase()),
                  items: Status.values
                      .map(
                        (status) => DropdownMenuItem(
                          value: status,
                          child: Text(
                            status.name.toUpperCase(),
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) async {
                    await taskNotifier.changeTaskStatus(value!, data.id);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
