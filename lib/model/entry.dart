// ignore_for_file: constant_identifier_names

enum EntryAttributes {
  ER_USERNAME,
  ER_PASSWORD,
  ER_DESCRIPTION,
  ER_URL,
  ER_ICON,
  ER_OTP,
  ER_NOTES,
  ER_WIFI_SSID,
  ER_WIFI_PASSWORD,
  ER_WIFI_SECURITY,

  ER_CREDIT_CARD_NUMBER,
  ER_CREDIT_CARD_PIN,
  ER_CREDIT_CARD_EXPIRATION_DATE,
  ER_CREDIT_CARD_CVV,
  ER_CREDIT_CARD_CARDHOLDER_NAME,

  ER_ID_NUMBER,
  ER_ID_ISSUER,
  ER_ID_EXPIRATION_DATE,
  ER_ID_ISSUER_COUNTRY,
  ER_ID_ISSUER_STATE,
  ER_ID_ISSUER_CITY,
  ER_ID_ISSUER_STREET,
  ER_ID_ISSUER_ZIP_CODE,
  ER_ID_ISSUER_HOUSE_NUMBER,
  ER_ID_ISSUER_PHONE_NUMBER,

  ER_SSH_PRIVATE_KEY,
  ER_SSH_PUBLIC_KEY,
  ER_SSH_KEY_PASSPHRASE,
  ER_SSH_KEY_USERNAME,
  ER_SSH_KEY_HOST,
  ER_SSH_KEY_PORT,

  ER_CERT_FILE,
  ER_CERT_PASSWORD,
}

class Entry {
  String title;
  DateTime creationDate;
  DateTime updateDate;
  Map<EntryAttributes, String>? attributes;

  Entry({
    required this.title,
    required this.creationDate,
    required this.updateDate,
    this.attributes,
  });
}

class EntryData extends Entry {
  EntryData({
    required super.title,
    required super.creationDate,
    required super.updateDate,
    super.attributes,
  });
}

class EntryFolder extends Entry {
  List<Entry> passwords;

  EntryFolder({
    required super.title,
    required super.creationDate,
    required super.updateDate,
    required this.passwords,
    super.attributes,
  });
}
