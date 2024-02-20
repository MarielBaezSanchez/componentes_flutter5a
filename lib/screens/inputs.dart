import 'package:flutter/material.dart';

class Inputs extends StatefulWidget {
  const Inputs({super.key});

  @override
  State<Inputs> createState() => _InputState();
}

class _InputState extends State<Inputs> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Ventana de entradas"),
    );
  }
}