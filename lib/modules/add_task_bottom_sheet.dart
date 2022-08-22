import 'package:flutter/material.dart';
import 'package:to_do/models/task_model.dart';
import 'package:to_do/shared/styles/colors.dart';
import 'package:to_do/utils/add_task_firebase.dart';

import '../shared/components/components.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var selectedDate = DateTime.now();
  var formKey = GlobalKey<FormState>();
  String title='';
  String description='';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add New Task',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.copyWith(color: Colors.black),
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Title'),
                      onChanged: (text){
                        title=text;
                      },
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Please Enter Task Title';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      maxLines: 3,
                      minLines: 3,
                      decoration: InputDecoration(labelText: 'Description'),
                      onChanged: (text){
                        description=text;
                      },
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Please Enter Task Description';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Select Time',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 8,
              ),
              InkWell(
                onTap: () {
                  OpenDataPicker();
                },
                child: Text(
                  '${selectedDate.year} - ${selectedDate.month} - ${selectedDate.day}',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              ElevatedButton(
                  onPressed: () {
                    if(formKey.currentState!.validate()){
                      //  insert to database
                      TaskModel tas=TaskModel(title: title, description: description,
                          datetime: DateUtils.dateOnly(selectedDate).microsecondsSinceEpoch);
                      showLoading(context,'Loading...');
                      addTaskFromFireBase(tas).then((value) {
                        hideLoadingDilog(context);
                        showMessage(context,'Added Succssfully','ok',(){
                          Navigator.pop(context);
                        });
                        Navigator.pop(context);
                      }).catchError((e){
                        print('error route $e');
                      });

                    }
                  },
                  child: Text('Add Task')),
            ],
          ),
        ),
      ),
    );
  }

  void OpenDataPicker() async {
    var choosenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (choosenDate != null) {
      selectedDate = choosenDate;
      setState(() {});
    }
  }
}
