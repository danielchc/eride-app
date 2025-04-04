import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class Base64Helper {
  static Uint8List _decodeBase64(String base64String) {
    return base64Decode(base64String);
  }

  static Image base64ToImage(String base64String) {
    Uint8List imageBytes = _decodeBase64(base64String);
    return Image.memory(imageBytes);
  }
}
