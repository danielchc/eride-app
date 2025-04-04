import 'package:eride_app/components/password_list.dart';
import 'package:eride_app/model/password.dart';
import 'package:flutter/material.dart';

class PasswordListScreen extends StatelessWidget {
  Entry currentEntry;
  PasswordListScreen({super.key, required this.currentEntry});
  @override
  Widget build(BuildContext context) {
    PasswordFolderEntry folderEntry = (currentEntry as PasswordFolderEntry);
    return Scaffold(
      appBar: AppBar(title: Text(folderEntry.title)),
      body: PasswordList(
        entries: folderEntry.passwords,
        onItemTap: (Entry entry) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                if (entry is PasswordEntry) {
                  // Replace with your detail screen
                  return Scaffold(
                    appBar: AppBar(title: Text(entry.title)),
                    body: Center(child: Text('Password: ${entry.title}')),
                  );
                } else if (entry is PasswordFolderEntry) {
                  return PasswordListScreen(currentEntry: entry);
                }
                return SizedBox.shrink();
              },
              // Replace with your detail screen
            ),
          );
        },
      ),
    );
  }
}
