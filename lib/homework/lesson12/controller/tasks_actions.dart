import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_course/homework/lesson12/presentation/widgets/task_item.dart';

class TasksActions extends ChangeNotifier {
  final ref = FirebaseFirestore.instance.collection('tasks');

  Future deleteTask(data) async {
    await ref.doc(data).delete();
    return;
  }

  Future addTask(Map task) async {
    await ref.add({...task});
    return;
  }

  Future changeTaskStatus(Status statusType, String id) async {
    await ref.doc(id).update({'status': statusType.name});
    return;
  }
}
