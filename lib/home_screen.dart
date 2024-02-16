import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App de componenetes de flutter'),
      ),
      body: ListView(
        children:  <Widget> [
          ListTile(
            title: Text('Entradas',
            style: Theme.of(context).textTheme.headlineLarge,
              ),

            subtitle: Text(
              'Recuperar información de TextField',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            leading:const Icon(Icons.inbox_rounded),
            trailing:const Icon(Icons.arrow_right_outlined),
          ),
          const Divider(),
          ListTile(
            title: Text(
              'Lista infinita',
              style: Theme.of(context).textTheme.headlineLarge,),
            subtitle: Text(
              'Recuperar muchos elementos',
              style: Theme.of(context).textTheme.bodySmall,
              ),
            leading:const Icon(Icons.list_alt_sharp),
            trailing:const Icon(Icons.arrow_right_outlined),
          ),
          const Divider(),
          ListTile(
            title: Text(
              'Notificaciones',
              style: Theme.of(context).textTheme.headlineLarge,),
            subtitle: Text(
              'Manejo de Notificaciones',
              style: Theme.of(context).textTheme.bodySmall,),
            leading:const Icon(Icons.notification_important),
            trailing:const Icon(Icons.arrow_right_outlined),
          ),
        ],
      ),
    );
  }
}