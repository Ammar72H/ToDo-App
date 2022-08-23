import 'package:flutter/material.dart';
import 'package:to_do/models/task_model.dart';
import 'package:to_do/shared/styles/colors.dart';
import 'package:to_do/utils/add_task_firebase.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../shared/components/components.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {

  late NavigatorState _navigator;

  @override
  void didChangeDependencies() {
    _navigator = Navigator.of(context);
    super.didChangeDependencies();
  }
  var selectedDate = DateTime.now();
  var formKey = GlobalKey<FormState>();
  String title='';
  String description='';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Padding(
        padding:MediaQuery.of(context).viewInsets,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12))),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '${AppLocalizations.of(context)!.add_new_task}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline2,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: '${AppLocalizations.of(context)!.title}',
                          labelStyle: Theme.of(context).textTheme.headline2!.copyWith(color: PrimaryColor,fontWeight: FontWeight.bold ),

                        ),
                        onChanged: (text){
                          title=text;
                        },
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return '${AppLocalizations.of(context)!.please_enter_task_title}';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        maxLines: 3,
                        minLines: 3,
                        decoration: InputDecoration(labelText: '${AppLocalizations.of(context)!.description}',
                          labelStyle:Theme.of(context).textTheme.headline2!.copyWith(color: PrimaryColor,fontWeight: FontWeight.bold),
                        ),
                        onChanged: (text){
                          description=text;
                        },
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return '${AppLocalizations.of(context)!.please_enter_task_description}';
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
                  '${AppLocalizations.of(context)!.select_time}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2!.copyWith(fontSize:18 ),
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
                    style:Theme.of(context).textTheme.headline2!.copyWith(fontSize:18 ),
                    textAlign: TextAlign.center,
                  ),

                ),
                SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        TaskModel tas=TaskModel(title: title, description: description,
                            datetime: DateUtils.dateOnly(selectedDate).microsecondsSinceEpoch);
                        showLoading(context,'${AppLocalizations.of(context)!.loading}');
                        addTaskFromFireBase(tas).then((value) {
                          hideLoadingDilog(context);
                          _navigator.pop(context);
                          showMessage(context,'${AppLocalizations.of(context)!.added_succssfully}',
                              '${AppLocalizations.of(context)!.ok}',(){
                                _navigator.pop(context);
                          },
                          );
                        });

                      }
                    },
                    child: Text('${AppLocalizations.of(context)!.add_task}',)),

              ],
            ),
          ),

        ),
      ),

    );

  }

   OpenDataPicker() async {
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
