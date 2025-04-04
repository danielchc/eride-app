class Entry {
  String title;
  String description;
  DateTime creationDate;
  DateTime updateDate;
  String? image;

  Entry({
    required this.title,
    required this.description,
    required this.creationDate,
    required this.updateDate,
    this.image,
  });
}

class PasswordEntry extends Entry {
  String password;

  PasswordEntry({
    required super.title,
    required super.description,
    required super.creationDate,
    required super.updateDate,
    required this.password,
    super.image,
  });
}

class PasswordFolderEntry extends Entry {
  List<Entry> passwords;

  PasswordFolderEntry({
    required super.title,
    required super.description,
    required super.creationDate,
    required super.updateDate,
    required this.passwords,
    super.image,
  });
}
