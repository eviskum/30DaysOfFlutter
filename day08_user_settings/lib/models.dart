enum Gender { FEMALE, MALE }

enum ProgrammingLanguage { DART, JAVA, C, BASIC, PYTHON }

class Settings {
  final String username;
  final Gender gender;
  final Set<ProgrammingLanguage> programmingLanguage;
  final bool isEmployed;

  Settings({required this.username, required this.gender, required this.programmingLanguage, required this.isEmployed});
}
