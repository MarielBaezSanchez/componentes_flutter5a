import 'package:flutter/material.dart';
import 'package:practica3/screens/home_screen.dart';
import 'package:practica3/screens/images_screen.dart';
import 'package:practica3/screens/infinite_list.dart';
import 'package:practica3/screens/inputs.dart';
import 'package:practica3/theme/app_theme.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
   State<Notifications> createState() => _NotificationsState();
}
class _NotificationsState extends State<Notifications> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificaciones'),
      ),
      body: const Center(
        child: Text("Notificaciones"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => openScreen(context, index),
        backgroundColor: AppTheme.widgetsColor,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: AppTheme.backColor,
            icon: Icon(Icons.home, color: AppTheme.disableWidgetColor,),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit, color: AppTheme.disableWidgetColor),
            label: 'Entradas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list, color: AppTheme.disableWidgetColor,),
            label: 'Lista',
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image, color: AppTheme.disableWidgetColor,),
            label: 'Imágenes',
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app, color: AppTheme.disableWidgetColor,),
            label: 'Salir',
            ),
        ],
      ),
    );
  }

  openScreen(BuildContext context, int index) {
    MaterialPageRoute ruta =
        MaterialPageRoute(builder: (context) => const HomeScreen());
    switch (index) {
      case 0:
        ruta = MaterialPageRoute(builder: (context) => const HomeScreen());
        break;
      case 1:
        ruta = MaterialPageRoute(builder: (context) => const Inputs());
        break;
      case 2:
        ruta = MaterialPageRoute(builder: (context) => const InfiniteList());
        break;
      case 3:
        ruta = MaterialPageRoute(builder: (context) => const ImagesScreen());
        break;
    }
    setState(() {
      selectedIndex;
      Navigator.push(context, ruta);
    });
  }
}
