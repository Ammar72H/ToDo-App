import 'package:flutter/material.dart';
import 'package:to_do/shared/styles/colors.dart';

class MyThemeData {
  static final ThemeData lightTheme = ThemeData(
      primaryColor: PrimaryColor,
      scaffoldBackgroundColor:mainBackgriundColor,
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: PrimaryColor,
          elevation: 0,
          iconTheme: IconThemeData(
            color:whiteColor,
          )),
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 22, color:whiteColor, fontWeight: FontWeight.w700,
        ),
        headline2: TextStyle(
          fontSize: 25,  color:PrimaryColor, fontWeight:FontWeight.w400,
        ),
        subtitle1: TextStyle(
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
        bodyText1: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),floatingActionButtonTheme: FloatingActionButtonThemeData(
           backgroundColor: PrimaryColor,),
      bottomSheetTheme:  BottomSheetThemeData(
        backgroundColor: Colors.transparent,

      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: PrimaryColor, unselectedItemColor: Colors.grey),

  );
}
