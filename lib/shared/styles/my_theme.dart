import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:to_do/shared/styles/colors.dart';

import 'colors.dart';
import 'colors.dart';

class MyThemeData {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: PrimaryColor,
    scaffoldBackgroundColor: mainBackgriundColor,
    appBarTheme: AppBarTheme(
        centerTitle: false,
        color: PrimaryColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: PrimaryColor,
        )),
    backgroundColor: whiteColor,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),


    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 30,
        color: whiteColor,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.w300,
      ),
      headline3: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w300,
      ),
      subtitle1: TextStyle(
        fontSize: 25,
        color: PrimaryColor,
        fontWeight: FontWeight.w400,
      ),
      bodyText1: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: PrimaryColor,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: whiteColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: PrimaryColor, unselectedItemColor: Colors.grey),
  );
  static final ThemeData darkTheme = ThemeData(
      primaryColor: PrimaryColorDark,
      appBarTheme: AppBarTheme(
          centerTitle: false,
          color: PrimaryColor,
          elevation: 0,
          iconTheme: IconThemeData(
            color: PrimaryColor,
          )),
      backgroundColor: Color(0xFF141922),
      iconTheme: IconThemeData(
        color: whiteColor,
      ),

      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 30,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        headline2: TextStyle(
          fontSize: 18,
          color: whiteColor,
          fontWeight: FontWeight.w300,
        ),
        headline3: TextStyle(
          fontSize: 20,
          color: whiteColor,
          fontWeight: FontWeight.w300,
        ),
        subtitle1: TextStyle(
          fontSize: 25,
          color: PrimaryColor,
          fontWeight: FontWeight.w400,
        ),
        subtitle2: TextStyle(
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        bodyText1: TextStyle(
          fontSize: 20,
          color: whiteColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: PrimaryColor,
      ),
      // backgroundColor: mainBackgriundColorDark,
      scaffoldBackgroundColor: mainBackgriundColorDark,
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.black),
      // textButtonTheme:TextButtonThemeData(
      //
      // ) ,
      bottomAppBarColor: Color(0xFF141922),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: mainBackgriundColorDark,
          selectedIconTheme: IconThemeData(color: PrimaryColor),
          selectedItemColor: PrimaryColorDark,
          unselectedItemColor: Colors.white));
}
