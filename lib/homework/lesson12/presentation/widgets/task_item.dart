import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum Status { pending, inProgress, completed }

class TaskItem extends ConsumerWidget {
  const TaskItem({super.key, required this.data, required this.number});

  final dynamic data;
  final int number;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusProvider = StateProvider<Status>((ref) {
      Status currentStatus =
          Status.values.firstWhere((element) => element.name == data['status']);
      return currentStatus;
    });

    final updateTaskProvider = Provider<dynamic>((ref) {
      final statusType = ref.watch(statusProvider);
      FirebaseFirestore.instance
          .collection('tasks')
          .doc(data.id)
          .update({'status': statusType.name});
    });
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
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(data['title'],
                      style: Theme.of(context).textTheme.titleLarge),
                )
              ],
            ),
            const SizedBox(height: 8),
            Text(data['description'],
                style: Theme.of(context).textTheme.titleMedium),
            Row(
              children: [
                Text('Deadline: ',
                    style: Theme.of(context).textTheme.titleMedium),
                Text(data['deadline'],
                    style: Theme.of(context).textTheme.titleMedium),
                const Spacer(),
                DropdownButton<Status>(
                  iconSize: 30,
                  iconEnabledColor: Theme.of(context).primaryColor,
                  dropdownColor: Theme.of(context).primaryColor,
                  value: ref.read(statusProvider),
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
                  onChanged: (value) {
                    ref.read(statusProvider.notifier).state = value!;
                    ref.watch(updateTaskProvider);
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
