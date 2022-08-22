import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:to_do/layout/home_layout.dart';
import 'package:to_do/shared/styles/my_theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:HomeLayout.routeName ,
      routes:{
        HomeLayout.routeName:(context) => HomeLayout(),
      },
      theme: MyThemeData.lightTheme,
      themeMode: ThemeMode.light,

    );
  }
}

