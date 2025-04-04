import 'dart:math';

import 'package:eride_app/model/entry.dart';

class PasswordProvider {
  // This class is a placeholder for the password provider.
  // In a real application, this would handle password management.

  static String generateOtpSecret() {
    const String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567';
    final random = Random.secure();
    return List.generate(
      16,
      (index) => chars[random.nextInt(chars.length)],
    ).join();
  }

  static List<Entry> generateExampleEntries() {
    return [
      EntryData(
        title: 'Email Account',
        creationDate: DateTime.now().subtract(Duration(days: 10)),
        updateDate: DateTime.now().subtract(Duration(days: 5)),
        attributes: {EntryAttributes.ER_DESCRIPTION: "Personal email account"},
      ),
      EntryFolder(
        title: 'Work Accounts',
        attributes: {
          EntryAttributes.ER_DESCRIPTION: 'Passwords for work-related accounts',
        },
        creationDate: DateTime.now().subtract(Duration(days: 20)),
        updateDate: DateTime.now().subtract(Duration(days: 10)),
        passwords: [
          EntryData(
            title: 'Google',
            attributes: {
              EntryAttributes.ER_USERNAME: 'papo@gmail.com',
              EntryAttributes.ER_PASSWORD: 'password123',
              EntryAttributes.ER_URL: 'https://www.google.com',
              EntryAttributes.ER_ICON:
                  "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",
            },
            creationDate: DateTime.now().subtract(Duration(days: 15)),
            updateDate: DateTime.now().subtract(Duration(days: 7)),
          ),
          EntryData(
            title: 'AWS',
            attributes: {
              EntryAttributes.ER_USERNAME: 'aws_user',
              EntryAttributes.ER_PASSWORD: 'aws_password',
              EntryAttributes.ER_URL: 'https://aws.amazon.com',
              EntryAttributes.ER_DESCRIPTION:
                  'Access to project management tool',
              EntryAttributes.ER_ICON:
                  "/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoKCgoKCgsMDAsPEA4QDxYUExMUFiIYGhgaGCIzICUgICUgMy03LCksNy1RQDg4QFFeT0pPXnFlZXGPiI+7u/sBCgoKCgoKCwwMCw8QDhAPFhQTExQWIhgaGBoYIjMgJSAgJSAzLTcsKSw3LVFAODhAUV5PSk9ecWVlcY+Ij7u7+//CABEIACAAIAMBIgACEQEDEQH/xAAZAAACAwEAAAAAAAAAAAAAAAAABQMEBgH/2gAIAQEAAAAAxUXZmWrT1s7bBQB//8QAFgEBAQEAAAAAAAAAAAAAAAAAAgMA/9oACgICEAMQAAAAtPaTK//EAC4QAAICAQMBAwwDAAAAAAAAAAECAwQFABESIRMxQhQVICIzQUNRYWJxkXOCwf/aAAgBAQABPwClislkg7U6jyojBWbdUUMfDu5HXU1C9ApaarKgFg1+o+KO9Pzp8ffiltQvVkWSqvKdffGCdhvq3h8rQhWa3SeFCwXcsp2YjfZgpJU6xlGhPip5mhp2bYs8GjtWjAkMHH2gAZS2nv4yxnMuJrkDVUmp5OBufqu9ePYxj7m1bySvi6tqK3F5xyT00n3Ybxml4n+QZtjrNwVpKc121Xp1snJZU7VLImSwH3LuyKW4ah8ilUJY5wsO6VByH91/0aGGll617tOYfycD+m0cNPH1nt0oR9ZeR/S67WhDDPCnZzbQkBzCqFnYjYr4uno//8QAGxEAAgMBAQEAAAAAAAAAAAAAAREAAgMTEmH/2gAIAQIBAT8AcZls9G89jX4R6E43suupsi1UCon/xAAcEQADAAIDAQAAAAAAAAAAAAABAhEAAxASE2H/2gAIAQMBAT8AnCukj6wfoMOeiremuUSk3P/Z",
            },
            creationDate: DateTime.now().subtract(Duration(days: 18)),
            updateDate: DateTime.now().subtract(Duration(days: 8)),
          ),
        ],
      ),
    ];
  }

  static List<EntryData> generateOtpEntries() {
    List<String> names = [
      'Google',
      'Facebook',
      'Twitter',
      'GitHub',
      'Amazon',
      'Dropbox',
      'Slack',
      'Discord',
      'Reddit',
      'LinkedIn',
    ];
    List<String> userNames = [
      "papo",
      "john",
      "doe",
      "jane",
      "smith",
      "alice",
      "bob",
      "charlie",
      "dave",
      "eve",
      "frank",
      "grace",
    ];

    List<String> OTPSecrets = [
      "L7WXNZDSXLIUJL6W",
      "4OAEAKQKW2P2EGPT",
      "GUSHR4EX3S6BTWYJ",
      "OBLJU53QLOH5PTSU",
      "653V3GAVL6S2PWPI",
      "D63FP6OBH7RW6FJ2",
      "S47GLVBJUCHJPS5D",
      "KOTK7FYA4HUMDA7C",
      "FEEY2KW2NER333UX",
      "B7PV7LK7WBZC6EYU",
      "X4BVVFQAP2LWIJJH",
      "4UKB766AOQNR6RRJ",
      "4OT666HOR7RUYYRC",
      "S5ZP5RO5NVBDSJEM",
      "653PSUU5XMW5WSRT",
      "GSLXC567D6EFPMLV",
    ];

    return List.generate(10, (index) {
      return EntryData(
        title: names[index % names.length],
        creationDate: DateTime.now().subtract(Duration(days: index * 2)),
        updateDate: DateTime.now().subtract(Duration(days: index)),
        attributes: {
          EntryAttributes.ER_USERNAME: userNames[index % userNames.length],

          EntryAttributes.ER_OTP:
              'otpauth://totp/tea:none?secret=${OTPSecrets[index % userNames.length]}&period=30&digits=6&issuer=tea&algorithm=SHA1',
        },
      );
    });
  }
}
