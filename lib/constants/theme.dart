import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTheme {

  ThemeData lightTheme(){
    final ThemeData lightmode = ThemeData.light();
    return lightmode.copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.white,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black,),
        titleTextStyle: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
      ),
      dividerTheme: const DividerThemeData(
        color: Colors.grey,
        thickness: 1.0,
      ),
      inputDecorationTheme: inputDecorationTheme(),
      
    );
  }

  InputDecorationTheme inputDecorationTheme(){
    const InputDecorationTheme theme = InputDecorationTheme(
      alignLabelWithHint: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: Color.fromARGB(255, 100, 100, 100), width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: Color.fromARGB(255, 50, 115, 220), width: 1.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: Colors.red, width: 1.0),
      ),
    );
    return theme;
  }

}