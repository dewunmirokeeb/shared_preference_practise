enum Gender { male, female, other }

enum ProgrammingLanguages {
  java,
  dart,
  // ignore: constant_identifier_names
  Golang,
  C,
  python,
  kotlin,
  swift,
}

class Settings {
  final String? username;
  final Gender? gender;
  final Set<ProgrammingLanguages>? programminglanguages;
  final bool? isemployed;
  Settings(
      {this.username, this.gender, this.isemployed, this.programminglanguages});
}
