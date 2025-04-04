import 'package:eride_app/model/entry.dart';
import 'package:eride_app/provider/password_provider.dart';
import 'package:eride_app/ui/entry_folder_ui.dart';
import 'package:eride_app/ui/totp_ui.dart';
import 'package:flutter/material.dart';

final class NavigationUI extends StatefulWidget {
  final BuildContext context;
  const NavigationUI({super.key, required this.context});

  @override
  State<NavigationUI> createState() => _NavigationUIState();
}

class _NavigationUIState extends State<NavigationUI> {
  int currentPageIndex = 0;

  late List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    tabs = <Widget>[
      /// Home page
      EntryFolderUI(
        currentEntry: EntryFolder(
          title: "Root",
          creationDate: DateTime.now().subtract(Duration(days: 7)),
          updateDate: DateTime.now().subtract(Duration(days: 7)),
          passwords: PasswordProvider.generateExampleEntries(),
        ),
      ),

      /// Notifications page
      ToptUI(context: widget.context),
    ];

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.password), label: 'Passwords'),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.timelapse_sharp)),
            label: 'TOTP',
          ),
        ],
      ),
      body: tabs[currentPageIndex],
    );
  }
}
