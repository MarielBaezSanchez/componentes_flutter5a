import 'package:flutter/material.dart';
import 'package:practica3/home_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 185, 213, 213),
        appBarTheme: const AppBarTheme(color: Color.fromARGB(198, 14, 131, 194)),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontFamily: 'sans-serif',
            fontSize: 27.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 39, 116)
          ),
          bodySmall: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 0, 0, 0)
          ),
        ),
      ),
    );
  }
}