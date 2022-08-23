import 'package:flutter/material.dart';
import 'package:to_do/modules/settings/settings.dart';
import 'package:to_do/modules/tasks/tasks.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../modules/tasks/add_task_bottom_sheet.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = '/';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar:
      AppBar(
        toolbarHeight: 100,
        title: Padding(
          padding: const EdgeInsets.all(20),
          child: Text('${AppLocalizations.of(context)!.to_do}', style: Theme
              .of(context)
              .textTheme
              .headline1,),
        ),
      ),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),

        notchMargin: 8,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onTap: (index) {
            currentIndex = index;
            setState(() {

            });
          },
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),

          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(
            side: BorderSide(
              color: Colors.transparent,
              width: 4,
            )
        ),
        child: Icon(Icons.add),
        onPressed: () {
          BottomSheetAddTask();
        },
      ),
    );
  }

  List<Widget>tabs = [TasksTab(), SettingsScreen()];

  BottomSheetAddTask() {
    showModalBottomSheet(context: context, builder: (context) {
      return AddTaskBottomSheet();
    });
  }

}













