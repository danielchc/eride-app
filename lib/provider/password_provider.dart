import 'package:eride_app/model/password.dart';

class PasswordProvider {
  // This class is a placeholder for the password provider.
  // In a real application, this would handle password management.

  static List<Entry> generateExampleEntries() {
    return [
      PasswordEntry(
        title: 'Email Account',
        description: 'Personal email account',
        creationDate: DateTime.now().subtract(Duration(days: 10)),
        updateDate: DateTime.now().subtract(Duration(days: 5)),
        password: 'email1234',
      ),
      PasswordFolderEntry(
        title: 'Work Accounts',
        description: 'Passwords for work-related accounts',
        creationDate: DateTime.now().subtract(Duration(days: 20)),
        updateDate: DateTime.now().subtract(Duration(days: 10)),
        passwords: [
          PasswordEntry(
            title: 'Work Email',
            description: 'Company email account',
            creationDate: DateTime.now().subtract(Duration(days: 15)),
            updateDate: DateTime.now().subtract(Duration(days: 7)),
            password: 'workemail5678',
          ),
          PasswordEntry(
            title: 'AWS',
            description: 'Access to project management tool',
            creationDate: DateTime.now().subtract(Duration(days: 18)),
            updateDate: DateTime.now().subtract(Duration(days: 8)),
            password: 'projecttool123',
            image:
                "/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoKCgoKCgsMDAsPEA4QDxYUExMUFiIYGhgaGCIzICUgICUgMy03LCksNy1RQDg4QFFeT0pPXnFlZXGPiI+7u/sBCgoKCgoKCwwMCw8QDhAPFhQTExQWIhgaGBoYIjMgJSAgJSAzLTcsKSw3LVFAODhAUV5PSk9ecWVlcY+Ij7u7+//CABEIACAAIAMBIgACEQEDEQH/xAAZAAACAwEAAAAAAAAAAAAAAAAABQMEBgH/2gAIAQEAAAAAxUXZmWrT1s7bBQB//8QAFgEBAQEAAAAAAAAAAAAAAAAAAgMA/9oACgICEAMQAAAAtPaTK//EAC4QAAICAQMBAwwDAAAAAAAAAAECAwQFABESIRMxQhQVICIzQUNRYWJxkXOCwf/aAAgBAQABPwClislkg7U6jyojBWbdUUMfDu5HXU1C9ApaarKgFg1+o+KO9Pzp8ffiltQvVkWSqvKdffGCdhvq3h8rQhWa3SeFCwXcsp2YjfZgpJU6xlGhPip5mhp2bYs8GjtWjAkMHH2gAZS2nv4yxnMuJrkDVUmp5OBufqu9ePYxj7m1bySvi6tqK3F5xyT00n3Ybxml4n+QZtjrNwVpKc121Xp1snJZU7VLImSwH3LuyKW4ah8ilUJY5wsO6VByH91/0aGGll617tOYfycD+m0cNPH1nt0oR9ZeR/S67WhDDPCnZzbQkBzCqFnYjYr4uno//8QAGxEAAgMBAQEAAAAAAAAAAAAAAREAAgMTEmH/2gAIAQIBAT8AcZls9G89jX4R6E43suupsi1UCon/xAAcEQADAAIDAQAAAAAAAAAAAAABAhEAAxASE2H/2gAIAQMBAT8AnCukj6wfoMOeiremuUSk3P/Z",
          ),
        ],
      ),
    ];
  }
}
