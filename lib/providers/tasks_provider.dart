// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:to_do/models/task_model.dart';
//
// import '../utils/add_task_firebase.dart';
//
// class TasksProvider extends ChangeNotifier{
//   List tasks = [];
//
//   void refreshTasks(DateTime dateTime)async{
//     tasks=[];
//    var snapshot= await getTaskFromFireBase(dateTime);
//    snapshot.docs.map((e) => tasks.add(e.data())).toList();
//     notifyListeners();
//
//   }
// }