import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  //constante del color primario
  static const primaryColor = Color.fromARGB(198, 14, 131, 194);
  //constanete del color secundario
  static const secondaryColor = Color.fromARGB(255, 0, 0, 0);
  //constante de color de fondo
  static const backColor = Color.fromARGB(255, 185, 213, 213);

  //definicion del yema del color y estilo de la app
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: backColor,
    appBarTheme: const AppBarTheme(color: primaryColor),
    textTheme: TextTheme(
      //títulos de primer nivel:
      headlineLarge: GoogleFonts.gabriela(
        fontSize: 27.0,
        fontWeight: FontWeight.bold,
        color: primaryColor,
        decoration: TextDecoration.underline,
        decorationColor: primaryColor,
        decorationStyle: TextDecorationStyle.double,
        decorationThickness: 1.0,        //fontFamily: GoogleFonts.dancingScript(),
        ),
        //fuente para textos muy pequeños
        bodySmall: GoogleFonts.montserrat(
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
          color: secondaryColor,
          fontStyle: FontStyle.italic
        ),
      ));
}
