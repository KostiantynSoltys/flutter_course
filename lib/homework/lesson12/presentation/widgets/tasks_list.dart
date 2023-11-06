import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_course/homework/lesson12/controller/tasks_actions.dart';
import 'package:flutter_course/homework/lesson12/presentation/widgets/'
    'task_item.dart';

Widget streamBuilder(context) {
  final taskStream = FirebaseFirestore.instance.collection('tasks').snapshots();
  final taskProvider = TasksActions();

  return StreamBuilder(
    stream: taskStream,
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return const Text('Connection error');
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }
      var docs = snapshot.data!.docs;

      return ListView.builder(
          itemCount: docs.length,
          itemBuilder: (context, index) {
            final number = index + 1;
            return Dismissible(
              key: ObjectKey(docs[index].data().keys),
              background: Container(
                color: Theme.of(context).colorScheme.error.withOpacity(0.75),
                margin: EdgeInsets.symmetric(
                    horizontal: Theme.of(context).cardTheme.margin!.horizontal,
                    vertical: 43),
              ),
              onDismissed: (direction) async {
                await taskProvider.deleteTask(docs[index].id);
              },
              child: InkWell(
                onTap: () => _showModalDialog(context, docs[index]),
                child: TaskItem(data: docs[index], number: number),
              ),
            );
          });
    },
  );
}

_showModalDialog(context, doc) {
  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Container(
                constraints: const BoxConstraints(maxHeight: 700),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              right: 0,
                              child: IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Опис",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                            text: doc['text'].toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.black,
                                wordSpacing: 1)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return Container();
      });
}
