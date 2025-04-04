import 'package:eride_app/model/entry.dart';
import 'package:eride_app/provider/password_provider.dart';
import 'package:eride_app/ui/navigation_ui.dart';
import 'package:eride_app/ui/entry_folder_ui.dart';
import 'package:flutter/material.dart';

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: NavigationUI(context: context),
    );
  }
}
