import 'package:flutter/material.dart';
import 'package:practica3/screens/home_screen.dart';
import 'package:practica3/screens/infinite_list.dart';
import 'package:practica3/screens/inputs.dart';
import 'package:practica3/screens/notification.dart';
import 'package:practica3/theme/app_theme.dart';

class ImagesScreen extends StatefulWidget {
  const ImagesScreen({super.key});

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Imágenes',
          style: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
      ),
      body: ListView(
        children: [
          imageCard(),
          imageWeb(),
        ],
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
            icon: Icon(Icons.notifications, color: AppTheme.disableWidgetColor,),
            label: 'Notificaciones',
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
        ruta = MaterialPageRoute(builder: (context) => const Notifications());
        break;
    }
    setState(() {
      selectedIndex;
      Navigator.push(context, ruta);
    });
  }

  Card imageCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.all(28),
      elevation: 10,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: const Image(image: AssetImage('assets/img/mapache.jpg')),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Mapache comiendo cheetos',
              style: TextStyle(color: AppTheme.secondaryColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget imageWeb() {
    return Center(
      child: Image.network(
        'https://i.ytimg.com/vi/nXSjwRI7gNA/maxresdefault.jpg',
      ),
    );
  }
}
