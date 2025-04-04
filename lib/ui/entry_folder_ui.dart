import 'package:eride_app/components/entry_list.dart';
import 'package:eride_app/model/entry.dart';
import 'package:eride_app/ui/entry_editor.dart';
import 'package:flutter/material.dart';

class EntryFolderUI extends StatelessWidget {
  final Entry currentEntry;
  const EntryFolderUI({super.key, required this.currentEntry});
  @override
  Widget build(BuildContext context) {
    EntryFolder folderEntry = (currentEntry as EntryFolder);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your action here
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(title: Text(folderEntry.title)),
      body: EntryList(
        entries: folderEntry.passwords,
        onItemTap: (Entry entry) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                if (entry is EntryData) {
                  // Replace with your detail screen
                  return EntryEditor(entryData: entry);
                } else if (entry is EntryFolder) {
                  return EntryFolderUI(currentEntry: entry);
                }
                return SizedBox.shrink();
              },
            ),
          );
        },
      ),
    );
  }
}
