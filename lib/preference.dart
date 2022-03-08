import 'module.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceServices {
  Future saveSettings(Settings settings) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('username', settings.username!);
    await preferences.setBool('isemployed', settings.isemployed!);
    await preferences.setInt('gender', settings.gender!.index);
    await preferences.setStringList(
        'programminglanguages',
        settings.programminglanguages!
            .map((lang) => lang.index.toString())
            .toList());
  }

  Future<Settings> getSettings() async {
    final preferences = await SharedPreferences.getInstance();
    final String? username = preferences.getString('username');
    final bool? isemployed = preferences.getBool('isemployed');
    final gender = Gender.values[preferences.getInt('gender') ?? 0];
    final programminglanguageindices =
        preferences.getStringList('prohramminglanguages');

    final programminglanguages = programminglanguageindices
        ?.map((stringIndex) =>
            ProgrammingLanguages.values[int.parse(stringIndex)])
        .toSet();

    return Settings(
      username: username,
      gender: gender,
      isemployed: isemployed,
      programminglanguages: programminglanguages,
    );
  }
}
