import 'package:flutter/material.dart';
import 'settings.dart';

void main() {
  runApp(const DataHome());
}

class DataHome extends StatelessWidget {
  const DataHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      title: 'Learning how to save data with shared preference',
      routes: {
        SettingsPage.id: (context) => const SettingsPage(),
      },
      home: const Homme(),
    );
  }
}

class Homme extends StatelessWidget {
  const Homme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
          child: const Text('Tap to Go to settings page'),
          onPressed: () {
            Navigator.pushNamed(context, SettingsPage.id);
          }),
    );
  }
}
