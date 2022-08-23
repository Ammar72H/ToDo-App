import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do/models/task_model.dart';


    CollectionReference<TaskModel>getTasksFromFirestore(){
      return FirebaseFirestore.instance.collection('tasks')
          .withConverter<TaskModel>(
          fromFirestore: (snapshot,op){
            return TaskModel.fromJson(snapshot.data()!);
          },
          toFirestore: (task,option)=>task.toJson());
    }

Future <void> addTaskFromFireBase(TaskModel task){

  var TypeCollection =getTasksFromFirestore();
  var doc= TypeCollection.doc();
  task.id=doc.id;
 return doc.set(task);
}


Future<void> deleteTaskFromFireStore(TaskModel task){
  var deletedTask =getTasksFromFirestore();
  return deletedTask.doc(task.id).delete();
}
Future<void> updateTaskFromFireStore(TaskModel task){
  var updateTask =getTasksFromFirestore();
  return updateTask.doc(task.id).delete();
}

Future<QuerySnapshot<TaskModel>> getTaskFromFireBase(DateTime dateTime){
      var tasks= getTasksFromFirestore() ;
      return tasks
          .where('date',isEqualTo: DateUtils.dateOnly(dateTime).microsecondsSinceEpoch)
          .get();
}

Stream<QuerySnapshot<TaskModel>> getTaskFromFireBaseUsingStream(DateTime dateTime){
  var tasks= getTasksFromFirestore() ;
  return tasks
      .where('date',isEqualTo: DateUtils.dateOnly(dateTime).microsecondsSinceEpoch)
      .snapshots();
}














