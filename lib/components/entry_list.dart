import 'package:eride_app/helpers/base64_helper.dart';
import 'package:eride_app/model/entry.dart';
import 'package:flutter/material.dart';

class EntryList extends StatelessWidget {
  final List<Entry> entries; // Accepts a list of items
  final Function(Entry) onItemTap; // Function to handle item tap

  const EntryList({super.key, required this.entries, required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: entries.length,
      itemBuilder: (context, index) {
        final entry = entries[index];
        return ListTile(
          leading: SizedBox(
            height: 40,
            width: 40,
            child:
                entry.attributes![EntryAttributes.ER_ICON] != null
                    ? Base64Helper.base64ToImage(
                      entry.attributes![EntryAttributes.ER_ICON]!,
                    )
                    : (entry is EntryData
                        ? Icon(Icons.lock)
                        : Icon(Icons.folder)),
          ),

          title: Text(entry.title),
          subtitle: Text(
            entry.attributes![EntryAttributes.ER_DESCRIPTION] ??
                entry.attributes![EntryAttributes.ER_USERNAME] ??
                "",
          ),
          onTap:
              () => onItemTap(
                entry,
              ), // Trigger the onItemTap function when an item is tapped
        );
      },
    );
  }
}
