import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do/models/task_model.dart';
import 'package:to_do/shared/components/components.dart';
import 'package:to_do/shared/styles/colors.dart';
import 'package:to_do/shared/styles/my_theme.dart';
import 'package:to_do/utils/add_task_firebase.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../providers/my_provider.dart';

class TaskItem extends StatefulWidget {
  TaskModel taskModel;

  TaskItem(this.taskModel);

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  late NavigatorState _navigator;

  @override
  void didChangeDependencies() {
    _navigator = Navigator.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Slidable(
      startActionPane: ActionPane(
        extentRatio: 0.25,
        motion: BehindMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {

              showMessage(
                  context,
                  '${AppLocalizations.of(context)!.are_you_sure_to_want_delete_this_task}',
                  '${AppLocalizations.of(context)!.yes}',
                  () {
                    // _navigator.pop();
                    deleteTask();
                    _navigator.pop();
                    hideLoadingDilog(context);

                  },
                  NegActionName: '${AppLocalizations.of(context)!.cancel}',
                  NagActionCallBack: () {
                    _navigator.pop();
                    hideLoadingDilog(context);
                    // _navigator.pop();
                  });
            },
            label: '${AppLocalizations.of(context)!.delete}',
            backgroundColor: Color(0xFFEC4B4B),
            icon: Icons.delete,
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.all(12),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 4,
              color:widget.taskModel.isDone! ? GreenColor
              :PrimaryColor,
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.taskModel.title,
                  style:widget.taskModel.isDone!
                      ?Theme.of(context) .textTheme .headline2 ?.copyWith(fontSize: 22,color: GreenColor)
                      : Theme.of(context).textTheme.subtitle1,
                ),
                Text(
                  widget.taskModel.description,
                  style
                      : Theme.of(context) .textTheme .headline2 ?.copyWith(fontSize: 15),
                )
              ],
            )),

            InkWell(
              onTap: () {
                updateTask();
              },
              child:
              widget.taskModel.isDone!
                  ? Text('${AppLocalizations.of(context)!.done}',
                style: Theme.of(context).textTheme.headline2!.copyWith(color: GreenColor,fontWeight: FontWeight.bold),)
                  :Container(
                      decoration: BoxDecoration(
                          color: PrimaryColor,
                          borderRadius: BorderRadius.circular(12)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void deleteTask() {
    deleteTaskFromFireStore(widget.taskModel).then((value) {
      hideLoadingDilog(context);
    }).catchError((e) {});
  }
  void updateTask() {
    updateTaskFromFireStore(widget.taskModel);

}}
