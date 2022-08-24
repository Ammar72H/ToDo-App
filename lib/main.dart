import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/layout/home_layout.dart';
import 'package:to_do/models/task_model.dart';
import 'package:to_do/providers/tasks_provider.dart';
import 'package:to_do/shared/styles/my_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../../providers/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // FirebaseFirestore.instance.disableNetwork();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MyProviderApp(), child: MyApp()),
      // ChangeNotifierProvider(create: (_) => TasksProvider(), child: MyApp()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  late MyProviderApp myProviderApp;

  @override
  Widget build(BuildContext context) {
    myProviderApp = Provider.of<MyProviderApp>(context);
    initSharedPref();
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English, no country code
        Locale('ar'), // Spanish, no country code
      ],
      locale: Locale(myProviderApp.AppLanguage),
      debugShowCheckedModeBanner: false,
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName: (context) => HomeLayout(),
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: myProviderApp.themeMode,
    );
  }

  void initSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString('language') ?? 'en';
    myProviderApp.changeLanguage(lang);
    if (prefs.getString('theme') == 'dark') {
      myProviderApp.changeTheme(ThemeMode.dark);
    } else if (prefs.getString('theme') == 'light') {
      myProviderApp.changeTheme(ThemeMode.light);
    }
  }
}
