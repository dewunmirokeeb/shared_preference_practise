import 'package:flutter/material.dart';
import 'preference.dart';
import 'module.dart';

class SettingsPage extends StatefulWidget {
  static String id = 'settings';
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  final _preferencesService = PreferenceServices();
  final _usernameController = TextEditingController();
  Gender? _selectedgender = Gender.female;
  bool _isemployed = false;
  final Set<ProgrammingLanguages> _selectedlanguages = <ProgrammingLanguages>{};

  void _populateFields() async {
    final settings = await _preferencesService.getSettings();
    setState(() {
      _usernameController.text = settings.username!;
      _selectedgender = settings.gender;
      _isemployed = settings.isemployed!;
    });
  }

  @override
  void initState() {
    super.initState();
    _populateFields();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Center(
          child: Text('User Settings'),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Enter Username'),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          RadioListTile<Gender>(
              activeColor: Colors.teal,
              title: const Text('Male'),
              value: Gender.male,
              groupValue: _selectedgender,
              onChanged: (Gender? value) {
                setState(() {
                  _selectedgender = value;
                });
              }),
          RadioListTile<Gender>(
              activeColor: Colors.teal,
              title: const Text('Female'),
              value: Gender.female,
              groupValue: _selectedgender,
              onChanged: (Gender? value) {
                setState(() {
                  _selectedgender = value;
                });
              }),
          RadioListTile<Gender>(
              activeColor: Colors.teal,
              title: const Text('Others'),
              value: Gender.other,
              groupValue: _selectedgender,
              onChanged: (Gender? value) {
                setState(() {
                  _selectedgender = value;
                });
              }),
          CheckboxListTile(
              activeColor: Colors.teal,
              title: const Text('Dart'),
              value: _selectedlanguages.contains(ProgrammingLanguages.dart),
              onChanged: (_) {
                setState(() {
                  _selectedlanguages.contains(ProgrammingLanguages.dart)
                      ? _selectedlanguages.remove(ProgrammingLanguages.dart)
                      : _selectedlanguages.add(ProgrammingLanguages.dart);
                });
              }),
          CheckboxListTile(
              activeColor: Colors.teal,
              title: const Text('JAVA'),
              value: _selectedlanguages.contains(ProgrammingLanguages.java),
              onChanged: (_) {
                setState(() {
                  _selectedlanguages.contains(ProgrammingLanguages.java)
                      ? _selectedlanguages.remove(ProgrammingLanguages.java)
                      : _selectedlanguages.add(ProgrammingLanguages.java);
                });
              }),
          SwitchListTile(
              title: const Text('Job Status'),
              activeColor: Colors.teal,
              value: _isemployed,
              onChanged: (_) {
                setState(() {
                  _isemployed ? _isemployed = false : _isemployed = true;
                });
              }),
          Padding(
            padding: const EdgeInsets.all(120.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.teal),
              ),
              onPressed: () {
                _savesettings;
                Navigator.pop(context);
              },
              child: const Text(
                "Save Settings",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _savesettings() {
    final newSetings = Settings(
        username: _usernameController.text,
        gender: _selectedgender,
        programminglanguages: _selectedlanguages,
        isemployed: _isemployed);
    _preferencesService.saveSettings(newSetings);
  }
}
