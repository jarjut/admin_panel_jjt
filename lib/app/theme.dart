import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const MaterialColor primaryColor = Colors.blue;
const MaterialColor accentColor = Colors.purple;

const InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
  errorStyle: TextStyle(fontSize: 11, height: 0.4),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(
      color: Colors.grey,
    ),
  ),
);

ThemeData appTheme() => ThemeData(
      primarySwatch: primaryColor,
      primaryColor: primaryColor,
      primaryColorLight: primaryColor[100],
      primaryColorDark: primaryColor[700],
      accentColor: accentColor,
      textTheme: GoogleFonts.latoTextTheme(),
      inputDecorationTheme: _inputDecorationTheme,
    );

ThemeData darkTheme() => ThemeData(
      brightness: Brightness.dark,
      primarySwatch: primaryColor,
      primaryColor: primaryColor,
      primaryColorLight: primaryColor[100],
      primaryColorDark: primaryColor[700],
      accentColor: accentColor,
      canvasColor: const Color(0xFF24232F),
      inputDecorationTheme: _inputDecorationTheme,
      textTheme: GoogleFonts.latoTextTheme(ThemeData.dark().textTheme),
    );
