import 'package:flutter/material.dart';
import 'package:practica3/models/data.dart';
import 'package:practica3/screens/notification.dart';
import 'package:practica3/theme/app_theme.dart';
import 'package:practica3/screens/home_screen.dart';
import 'package:practica3/screens/infinite_list.dart';
import 'package:practica3/screens/inputs.dart';
import 'package:practica3/screens/images_screen.dart';

class DataScreen extends StatefulWidget {
  final Data datos;
  const DataScreen({Key? key, required this.datos}) : super(key: key);

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    String? respuesta;
    if (widget.datos.pastel == true) {
      respuesta = 'Te gusta el pastel';
    } else if (widget.datos.helado == true) {
      respuesta = 'Te gusta el helado';
    } else if (widget.datos.chocoflan == true) {
      respuesta = 'Te gusta el chocoflan';
    } else {
      respuesta = 'No has seleccionado ningún postre';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DataScreen',
          style: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'El nombre que escribiste es: ',
              style: AppTheme.lightTheme.textTheme.headlineLarge,
              textAlign: TextAlign.left,
            ),
            Text(
              widget.datos.nombre ?? 'No proporcionado',
              textAlign: TextAlign.left,
              style: const TextStyle(color: AppTheme.secondaryColor),
            ),
            const SizedBox(height: 20),
            Text(
              'El postre que seleccionaste es: ',
              style: AppTheme.lightTheme.textTheme.headlineLarge,
              textAlign: TextAlign.left,
            ),
            Text(
              respuesta,
              textAlign: TextAlign.left,
              style: const TextStyle(color: AppTheme.secondaryColor),
            ),
            const SizedBox(height: 20),
            Text(
              'Seleccionaste la comida: ',
              style: AppTheme.lightTheme.textTheme.headlineLarge,
              textAlign: TextAlign.left,
            ),
            Text(
              widget.datos.comida ?? 'No proporcionado',
              textAlign: TextAlign.left,
              style: const TextStyle(color: AppTheme.secondaryColor),
            ),
            const SizedBox(height: 20),
            Text(
              'El nivel que seleccionaste en tu gusto de Flutter es: ',
              style: AppTheme.lightTheme.textTheme.headlineLarge,
              textAlign: TextAlign.left,
            ),
            Text(
              widget.datos.califFlutter?.toString() ?? 'No proporcionado',
              textAlign: TextAlign.left,
              style: const TextStyle(color: AppTheme.secondaryColor),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => openScreen(context, index),
        backgroundColor: AppTheme.widgetsColor,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: AppTheme.backColor,
            icon: Icon(Icons.home, color: AppTheme.disableWidgetColor),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list, color: AppTheme.disableWidgetColor),
            label: 'Lista',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: AppTheme.disableWidgetColor),
            label: 'Notificaciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit, color: AppTheme.disableWidgetColor),
            label: 'Entradas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image, color: AppTheme.disableWidgetColor),
            label: 'Imágenes',
          ),
        ],
      ),
    );
  }

  void openScreen(BuildContext context, int index) {
    MaterialPageRoute ruta = MaterialPageRoute(builder: (context) => const HomeScreen());
    switch (index) {
      case 0:
        ruta = MaterialPageRoute(builder: (context) => const HomeScreen());
        break;
      case 1:
        ruta = MaterialPageRoute(builder: (context) => const InfiniteList());
        break;
      case 2:
        ruta = MaterialPageRoute(builder: (context) => const Notifications());
        break;
      case 3:
        ruta = MaterialPageRoute(builder: (context) => const Inputs());
        break;
      case 4:
        ruta = MaterialPageRoute(builder: (context) => const ImagesScreen());
        break;
      default:
        ruta = MaterialPageRoute(builder: (context) => const HomeScreen());
        break;
    }
    setState(() {
      selectedIndex = index;
      Navigator.push(context, ruta);
    });
  }
}
