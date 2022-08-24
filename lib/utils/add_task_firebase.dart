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

Future <void> addTaskFromFireBase(TaskModel taskModel){

  var TypeCollection =getTasksFromFirestore();
  var doc= TypeCollection.doc();
  taskModel.id=doc.id;
 return doc.set(taskModel);
}


Future<void> deleteTaskFromFireStore(TaskModel taskModel){
  var deletedTask =getTasksFromFirestore();
  return deletedTask.doc(taskModel.id).delete();
}

Future<void> updateTaskFromFireStore(TaskModel taskModel){
  var updateTask =getTasksFromFirestore();
  return updateTask.doc(taskModel.id).update({'isDone':!taskModel.isDone!});
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














