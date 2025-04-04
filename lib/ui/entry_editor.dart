import 'package:eride_app/model/entry.dart';
import 'package:flutter/material.dart';

class EntryEditor extends StatefulWidget {
  const EntryEditor({super.key, required this.entryData});
  final EntryData entryData;

  @override
  State<EntryEditor> createState() => _EntryEditorState();
}

class _EntryEditorState extends State<EntryEditor> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController urlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    usernameController.text =
        widget.entryData.attributes![EntryAttributes.ER_USERNAME] ?? "";
    passwordController.text =
        widget.entryData.attributes![EntryAttributes.ER_PASSWORD] ?? "";
    urlController.text =
        widget.entryData.attributes![EntryAttributes.ER_URL] ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.entryData.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            TextField(
              controller: urlController,
              decoration: InputDecoration(
                labelText: 'URL',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle save action
                  print('Username: ${usernameController.text}');
                  print('Password: ${passwordController.text}');
                  print('URL: ${urlController.text}');
                },
                child: Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
