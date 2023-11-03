import 'package:flutter/material.dart';
import 'package:flutter_course/homework/lesson12/presentation/widgets/'
    'task_item.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class NewTask extends StatefulWidget {
  const NewTask({super.key, required this.onAddTask});

  final void Function(Map task) onAddTask;

  @override
  State<NewTask> createState() {
    return _NewTaskState();
  }
}

class _NewTaskState extends State<NewTask> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _textController = TextEditingController();
  DateTime? _selectedDeadline;
  Status _selectedStatus = Status.pending;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year, now.month, now.day + 1);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: firstDate,
        firstDate: firstDate,
        lastDate: DateTime.parse("20231211"));
    setState(() {
      _selectedDeadline = pickedDate;
    });
  }

  void _showDialogue() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text(
          'Invalid input',
        ),
        content: const Text(
            'Please make sure a valid title, description, deadline and status '
            'was entered'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  void _submitTaskData() {
    if (_titleController.text.trim().isEmpty ||
        _descriptionController.text.trim().isEmpty ||
        _textController.text.trim().isEmpty ||
        _selectedDeadline == null) {
      _showDialogue();
      return;
    }
    widget.onAddTask(
      {
        'title': _titleController.text.toString(),
        'description': _descriptionController.text.toString(),
        'text': _textController.text.toString(),
        'deadline': _selectedDeadline.toString().substring(0, 10),
        'status': _selectedStatus.name.toString(),
      },
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(
      builder: (ctx, constraints) {
        final width = constraints.maxWidth;

        return SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
              child: Column(
                children: [
                  if (width >= 600)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _titleController,
                            maxLength: 50,
                            decoration: const InputDecoration(
                              label: Text('Title'),
                            ),
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: TextField(
                            controller: _descriptionController,
                            decoration: const InputDecoration(
                              label: Text('Description'),
                            ),
                          ),
                        ),
                      ],
                    )
                  else
                    Column(
                      children: [
                        TextField(
                          controller: _titleController,
                          maxLength: 50,
                          decoration: const InputDecoration(
                            label: Text('Title'),
                          ),
                        ),
                        TextField(
                          controller: _descriptionController,
                          maxLength: 50,
                          decoration: const InputDecoration(
                            label: Text('Description'),
                          ),
                        ),
                        TextField(
                          controller: _textController,
                          maxLength: 1500,
                          decoration: const InputDecoration(
                            label: Text('Text'),
                          ),
                        ),
                      ],
                    ),
                  if (width >= 600)
                    TextField(
                      controller: _textController,
                      maxLength: 1500,
                      decoration: const InputDecoration(
                        label: Text('Text'),
                      ),
                    )
                  else
                    Row(
                      children: [
                        const SizedBox(width: 16),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              DropdownButton(
                                value: _selectedStatus,
                                items: Status.values
                                    .map(
                                      (category) => DropdownMenuItem(
                                        value: category,
                                        child:
                                            Text(category.name.toUpperCase()),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  if (value == null) {
                                    return;
                                  }
                                  setState(
                                    () {
                                      _selectedStatus = value;
                                    },
                                  );
                                },
                              ),
                              Text(
                                _selectedDeadline == null
                                    ? 'Select deadline'
                                    : formatter.format(_selectedDeadline!),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              IconButton(
                                onPressed: _presentDatePicker,
                                icon: const Icon(Icons.calendar_month),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 16),
                  if (width >= 600)
                    Row(
                      children: [
                        //const Spacer(),
                        DropdownButton(
                          value: _selectedStatus,
                          items: Status.values
                              .map(
                                (category) => DropdownMenuItem(
                                  value: category,
                                  child: Text(category.name.toUpperCase()),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            if (value == null) {
                              return;
                            }
                            setState(
                              () {
                                _selectedStatus = value;
                              },
                            );
                          },
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                  _selectedDeadline == null
                                      ? 'Select deadline'
                                      : formatter.format(_selectedDeadline!),
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              IconButton(
                                onPressed: _presentDatePicker,
                                icon: const Icon(Icons.calendar_month),
                              )
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                        //const Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            _submitTaskData();
                          },
                          child: const Text('Save Task'),
                        ),
                      ],
                    )
                  else
                    Row(
                      children: [
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            _submitTaskData();
                          },
                          child: const Text('Save Task'),
                        ),
                      ],
                    )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
