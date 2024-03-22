import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practica3/models/data.dart';
import 'package:practica3/screens/data_screen.dart';
import 'package:practica3/screens/home_screen.dart';
import 'package:practica3/screens/images_screen.dart';
import 'package:practica3/screens/infinite_list.dart';
import 'package:practica3/screens/notification.dart';
import 'package:practica3/theme/app_theme.dart';

class Inputs extends StatefulWidget {
  const Inputs({super.key});

  @override
  State<Inputs> createState() => _InputsState();
}

class _InputsState extends State<Inputs> {
  String? nombre;
  bool valueSwitch = false;
  double sliderValue = 0.0;
  String? foodRadio;
  bool postreCheck1 = false;
  bool postreCheck2 = false;
  bool postreCheck3 = false;
  int selectedIndex = 0; //Elemento seleccionado de la BottomNavigationBar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entradas'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                entradaTexto(),
                entradaSwitch(),
                entradaSlider(),
                entradaRadio(),
                Text(
                  'Que postres te gustan?',
                  style: AppTheme.lightTheme.textTheme.headlineLarge,
                ),
                entradasCheck(),
                ElevatedButton(
                  onPressed: () {
                    Data data = Data(
                      nomb: nombre!,
                      flutter: valueSwitch,
                      calif: sliderValue.round(),
                      food: foodRadio!,
                      icecream: postreCheck1,
                      flan: postreCheck2,
                      cake: postreCheck3,
                    );
                    final ruta = MaterialPageRoute(builder: (context) {
                      return DataScreen(
                        datos: data,
                      );
                    });
                    Navigator.push(context, ruta);
                  },
                  child: Text(
                    'Guardar',
                    style: AppTheme.lightTheme.textTheme.headlineLarge,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => openScreen(context, index),
        backgroundColor:  AppTheme.widgetsColor,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: AppTheme.backColor,
            icon: Icon(
              Icons.home,
              color: AppTheme.disableWidgetColor
            ),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
              color: AppTheme.disableWidgetColor,
            ),
            label: 'Lista',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              color: AppTheme.disableWidgetColor,
            ),
            label: 'Notificaciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.image,
              color: AppTheme.disableWidgetColor,
            ),
            label: 'Imagenes',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.exit_to_app,
              color: AppTheme.disableWidgetColor,
            ),
            label: 'Lista',
          ),
        ],
      ),
    );
  }

  openScreen(BuildContext context, int index) {
    MaterialPageRoute ruta = MaterialPageRoute(
      builder: (context) => const HomeScreen(),
    );
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
        ruta = MaterialPageRoute(builder: (context) => const ImagesScreen());
        break;
      case 4:
        // No aplicable en navegadr ni en windows
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        break;
    }
    setState(() {
      selectedIndex = index;
      Navigator.push(context, ruta);
    });
  }

  TextField entradaTexto() {
    return TextField(
      style: AppTheme.lightTheme.textTheme.headlineMedium,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: 'Escribe tu nombre: ',
        labelStyle: AppTheme.lightTheme.textTheme.headlineLarge,
      ),
      onChanged: (text) {
        nombre = text;
      },
    );
  }

  Row entradaSwitch() {
    return Row(
      children: [
        const FlutterLogo(),
        Text(
          '¿Te gusta flutter?',
          style: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
        Switch(
            value: valueSwitch,
            onChanged: (value) {
              setState(() {
                valueSwitch = value;
              });
            })
      ],
    );
  }

  Column entradaSlider() {
    return Column(
      children: [
        Text(
          '¿Qué tanto te gusta flutter?',
          style: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
        Slider(
          min: 0.0,
          max: 10.0,
          value: sliderValue,
          divisions: 10,
          label: '${sliderValue.round()}',
          onChanged: (value) {
            setState(
              () {
                sliderValue = value;
                //print('Valor de Slider: $sliderValue');
              },
            );
          },
        ),
      ],
    );
  }

  Column entradaRadio() {
    return Column(
      children: [
        Text(
          'Que prefieres usar para el desarrollo movil?',
          style: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
        ListTile(
          title: Text(
            'Tacos al pastor',
            style: AppTheme.lightTheme.textTheme.bodySmall,
          ),
          leading: Radio(
            value: 'Tacos al pastor',
            groupValue: foodRadio,
            onChanged: (value) {
              setState(() {
                foodRadio = value!;
                //print('Comida seleccionada: $foodRadio');
              });
            },
          ),
        ),
        ListTile(
          title: Text(
            'Chileatole',
            style: AppTheme.lightTheme.textTheme.bodySmall,
          ),
          leading: Radio(
            value: 'Chileatole',
            groupValue: foodRadio,
            onChanged: (value) {
              setState(() {
                foodRadio = value!;
                // print('Comida seleccionada: $foodRadio');
              });
            },
          ),
        ),
        ListTile(
          title: Text(
            'Pozole',
            style: AppTheme.lightTheme.textTheme.bodySmall,
          ),
          leading: Radio(
            value: 'Pozole',
            groupValue: foodRadio,
            onChanged: (value) {
              setState(() {
                foodRadio = value!;
                //print('Comida seleccionada: $foodRadio');
              });
            },
          ),
        ),
      ],
    );
  }

  Row entradasCheck() {
    return Row(
      children: [
        Text(
          'Helado de chocoretas',
          style: AppTheme.lightTheme.textTheme.bodySmall,
        ),
        Checkbox(
          value: postreCheck1,
          onChanged: (value) {
            setState(() {
              postreCheck1 = value!;
            });
          },
        ),
        Text(
          'Chocoflan',
          style: AppTheme.lightTheme.textTheme.bodySmall,
        ),
        Checkbox(
          value: postreCheck2,
          onChanged: (value) {
            setState(() {
              postreCheck2 = value!;
            });
          },
        ),
        Text(
          'Pastel de ferrero',
          style: AppTheme.lightTheme.textTheme.bodySmall,
        ),
        Checkbox(
          value: postreCheck3,
          onChanged: (value) {
            setState(() {
              postreCheck3 = value!;
            });
          },
        ),
      ],
    );
  }
}