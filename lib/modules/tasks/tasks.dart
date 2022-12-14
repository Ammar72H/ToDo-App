import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do/models/task_model.dart';
import 'package:to_do/modules/tasks/task_item.dart';
import 'package:to_do/shared/styles/colors.dart';
import 'package:to_do/utils/add_task_firebase.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TasksTab extends StatefulWidget {
  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  DateTime selectedDate=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: selectedDate,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
              if(date == null)return;
              selectedDate=date;
              setState((){

              });
            },
            leftMargin: 20,
            monthColor:Theme.of(context).textTheme.headline2?.color,
            dayColor: Theme.of(context).textTheme.headline2?.color,
            activeDayColor: PrimaryColor,
            activeBackgroundDayColor: Theme.of(context).backgroundColor,
            dotsColor: PrimaryColor,
            selectableDayPredicate: (date) => true,
            locale: 'en',
          ),
          Expanded(
              child: StreamBuilder<QuerySnapshot<TaskModel>>(
                  stream: getTaskFromFireBaseUsingStream(selectedDate),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Text("Something went wrong");
                    }
                    List<TaskModel> tasks =
                        snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return TaskItem(tasks[index]);
                      },
                      itemCount: tasks.length,
                    );
                  }))
        ],
      ),
    );
  }
}