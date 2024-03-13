import 'package:flutter/material.dart';
import 'package:practica3/models/data.dart';
import 'package:practica3/screens/home_screen.dart';
import 'package:practica3/screens/images_screen.dart';
import 'package:practica3/screens/infinite_list.dart';
import 'package:practica3/screens/inputs.dart';
import 'package:practica3/screens/notification.dart';
import 'package:practica3/theme/app_theme.dart';

class DataScreen extends StatefulWidget {
  final Data datos;
  const DataScreen({super.key, required this.datos});

  @override
  // ignore: library_private_types_in_public_api
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DataScreen'),
      ),
      body: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Alinie los widgets al inicio
        children: [
          Text(
            "Tu nombre es: ",
            style: AppTheme.lightTheme.textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Te gusta Flutter: ",
            style: AppTheme.lightTheme.textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Nivel de gusto por flutter: ",
            style: AppTheme.lightTheme.textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Prefieres: ",
            style: AppTheme.lightTheme.textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Postre que prefieres: ",
            style: AppTheme.lightTheme.textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 15,
          ),
        ],
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
            icon: Icon(Icons.exit_to_app, color: AppTheme.disableWidgetColor),
            label: 'Salir',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit, color: AppTheme.disableWidgetColor),
            label: 'Entradas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image, color: AppTheme.disableWidgetColor),
            label: 'Image',
          ),
        ],
      ),
    );
  }

  void openScreen(BuildContext context, int index) {
    MaterialPageRoute ruta =
        MaterialPageRoute(builder: (context) => const HomeScreen());
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
      case 4:
        ruta = MaterialPageRoute(builder: (context) => const Inputs());
        break;
      case 5:
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
