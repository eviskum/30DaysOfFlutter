import 'package:day08_user_settings/models.dart';
import 'package:day08_user_settings/preferences_services.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _usernameController = TextEditingController();
  Gender? _selectedGender = Gender.FEMALE;
  Set<ProgrammingLanguage> _selectedLanguages = Set<ProgrammingLanguage>();
  bool _isEmployeed = false;
  PreferencesService _preferencesService = PreferencesService();

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('User Settings'),
        ),
        body: ListView(
          children: [
            _usernameListTile(),
            _genderRadio('Female', Gender.FEMALE),
            _genderRadio('Male', Gender.MALE),
            _programmingLanguageCheckbox('BASIC', ProgrammingLanguage.BASIC),
            _programmingLanguageCheckbox('C', ProgrammingLanguage.C),
            _programmingLanguageCheckbox('JAVA', ProgrammingLanguage.JAVA),
            _programmingLanguageCheckbox('PYTHON', ProgrammingLanguage.PYTHON),
            _employedSwitch(),
            TextButton(onPressed: _saveSettings, child: Text('Save Settings'))
          ],
        ),
      ),
    );
  }

  ListTile _usernameListTile() {
    return ListTile(
      title: TextField(
        controller: _usernameController,
        decoration: InputDecoration(labelText: 'Username'),
      ),
    );
  }

  SwitchListTile _employedSwitch() {
    return SwitchListTile(
        title: Text('Is Employed'),
        value: _isEmployeed,
        onChanged: (newValue) => setState(() => _isEmployeed = newValue));
  }

  CheckboxListTile _programmingLanguageCheckbox(String title, ProgrammingLanguage programmingLanguage) {
    return CheckboxListTile(
      title: Text(title),
      value: _selectedLanguages.contains(programmingLanguage),
      onChanged: (_) {
        setState(() {
          _selectedLanguages.contains(programmingLanguage)
              ? _selectedLanguages.remove(programmingLanguage)
              : _selectedLanguages.add(programmingLanguage);
        });
      },
    );
  }

  RadioListTile<Gender> _genderRadio(String title, Gender gender) {
    return RadioListTile(
        title: Text(title),
        value: gender,
        groupValue: _selectedGender,
        onChanged: (newValue) => setState(() => _selectedGender = newValue));
  }

  void _saveSettings() {
    final newSettings = Settings(
        username: _usernameController.text,
        gender: _selectedGender ?? Gender.FEMALE,
        programmingLanguage: _selectedLanguages,
        isEmployed: _isEmployeed);

    print(newSettings.toString());
    _preferencesService.saveSettings(newSettings);
  }

  void _loadSettings() async {
    final settings = await _preferencesService.getSettings();
    if (settings == null) return;
    setState(() {
      _usernameController.text = settings.username;
      _selectedGender = settings.gender;
      _selectedLanguages = settings.programmingLanguage;
      _isEmployeed = settings.isEmployed;
    });

    print('State loaded');
  }
}
