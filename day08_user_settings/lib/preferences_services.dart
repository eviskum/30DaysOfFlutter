import 'package:shared_preferences/shared_preferences.dart';

import 'models.dart';

class PreferencesService {
  Future saveSettings(Settings settings) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString('username', settings.username);
    await preferences.setBool('isEmployed', settings.isEmployed);
    await preferences.setInt('gender', settings.gender.index);
    await preferences.setStringList(
        'programmingLanguages', settings.programmingLanguage.map((e) => e.index.toString()).toList());

    print('Saved Seetings');
  }

  Future<Settings?> getSettings() async {
    final preferences = await SharedPreferences.getInstance();

    final username = preferences.getString('username');
    final isEmployed = preferences.getBool('isEmployed');
    final gender = Gender.values[preferences.getInt('gender') ?? 0];
    final programmingLanguageIndicies = preferences.getStringList('programmingLanguages');
    final programmingLanguage =
        programmingLanguageIndicies?.map((e) => ProgrammingLanguage.values[int.parse(e)]).toSet() ??
            Set<ProgrammingLanguage>();

    if (username == null || isEmployed == null) return null;
    return Settings(
        username: username, gender: gender, programmingLanguage: programmingLanguage, isEmployed: isEmployed);
  }
}
