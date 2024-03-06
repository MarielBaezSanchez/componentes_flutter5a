import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  //constante del color primario
  static const primaryColor = Color.fromARGB(198, 14, 131, 194);
  //constanete del color secundario
  static const secondaryColor = Color.fromARGB(255, 0, 0, 0);
  //constante de color de fondo
  static const backColor = Color.fromARGB(255, 185, 213, 213);
  //constante de color de botones
  static const widgetsColor = Color.fromARGB(255, 169, 110, 208);
  //constante de color de botones y widgets deshabilitados
  static const disableWidgetColor = Color.fromARGB(255, 89, 43, 227);

  //definicion del yema del color y estilo de la app
  static final ThemeData lightTheme = ThemeData.light().copyWith(
      //colores del tema
      scaffoldBackgroundColor: backColor,
      appBarTheme: AppBarTheme(
        color: primaryColor,
        titleTextStyle: GoogleFonts.lato(
          color: backColor,
          fontSize: 28.5,
          fontWeight: FontWeight.bold,
        ),
        ),
        iconTheme: const IconThemeData(
          color: primaryColor,
          size: 35.0,
        ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(widgetsColor),
            foregroundColor: MaterialStateProperty.all(backColor),
            textStyle: MaterialStateProperty.all(
              GoogleFonts.pacifico(fontSize: 24.5,))
            )
          ),

      //estilo de los textos
      textTheme: TextTheme(
        //títulos de primer nivel:
        headlineLarge: GoogleFonts.gabriela(
          fontSize: 27.0,
          fontWeight: FontWeight.bold,
          color: primaryColor,
          decoration: TextDecoration.underline,
          decorationColor: primaryColor,
          decorationStyle: TextDecorationStyle.double,
          decorationThickness: 1.0, //fontFamily: GoogleFonts.dancingScript(),
        ),

        headlineMedium: GoogleFonts.alexandria(
          fontSize: 25.5,
          fontWeight: FontWeight.w700,
          color: secondaryColor,
        ),

        //fuente para textos muy pequeños
        bodySmall: GoogleFonts.montserrat(
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
            color: secondaryColor,
            fontStyle: FontStyle.italic),
      ));
}
