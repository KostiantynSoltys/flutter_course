import 'package:flutter/material.dart';

enum Status {pending, inProgress, completed}

class TaskItem extends StatelessWidget {
  const TaskItem(
      {super.key,
      required this.data,
      required this.onChangeStatus,
      required this.number});

  final dynamic data;
  final Function onChangeStatus;
  final int number;
  

  @override
  Widget build(BuildContext context) {
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
                      style: Theme.of(context).textTheme.bodyLarge),
                  Text(data['deadline']),
                  const Spacer(),
                  DropdownButton(
                    iconSize: 30,
                    iconEnabledColor: Theme.of(context).primaryColor,
                    dropdownColor: Theme.of(context).primaryColor,
                    hint: Text(data['status'].toString().toUpperCase()),
                    items: Status.values
                        .map(
                          (status) => DropdownMenuItem(
                            value: status,
                            child: Text(
                              status.name.toUpperCase(),
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }
                      onChangeStatus(data, value.name.toString());
                      // check();
                    },
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
