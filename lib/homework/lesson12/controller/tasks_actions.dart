import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
}
