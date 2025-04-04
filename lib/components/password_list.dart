import 'package:eride_app/model/password.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:typed_data';

// Define a model for the data (you can use any model class that fits your needs)
class ListItem {
  final String title;
  final String description;

  ListItem({required this.title, required this.description});
}

class PasswordList extends StatelessWidget {
  final List<Entry> entries; // Accepts a list of items
  final Function(Entry) onItemTap; // Function to handle item tap

  // Constructor to initialize with items and an onTap function
  const PasswordList({
    super.key,
    required this.entries,
    required this.onItemTap,
  });

  Uint8List _decodeBase64(String base64String) {
    return base64Decode(base64String);
  }

  Image _base64ToImage(String base64String) {
    Uint8List imageBytes = _decodeBase64(base64String);
    return Image.memory(imageBytes);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: entries.length,
      itemBuilder: (context, index) {
        final entry = entries[index];
        return ListTile(
          leading:
              entry.image != null
                  ? _base64ToImage(entry.image ?? "")
                  : (entry is PasswordEntry
                      ? Icon(Icons.lock)
                      : Icon(Icons.folder)),
          title: Text(entry.title), // Display the title of each item
          subtitle: Text(
            entry.description,
          ), // Display the description of each item
          onTap:
              () => onItemTap(
                entry,
              ), // Trigger the onItemTap function when an item is tapped
        );
      },
    );
  }
}
