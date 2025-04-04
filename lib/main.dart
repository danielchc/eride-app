import 'package:eride_app/model/password.dart';
import 'package:eride_app/provider/password_provider.dart';
import 'package:eride_app/ui/password_subfolder.dart';
import 'package:flutter/material.dart';

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: AppNavigation(context: context),
    );
  }
}

class AppNavigation extends StatefulWidget {
  BuildContext context;
  AppNavigation({super.key, required this.context});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int currentPageIndex = 0;

  late List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    tabs = <Widget>[
      /// Home page
      PasswordListScreen(
        currentEntry: PasswordFolderEntry(
          title: "Root",
          description: "ROOT",
          creationDate: DateTime.now().subtract(Duration(days: 7)),
          updateDate: DateTime.now().subtract(Duration(days: 7)),
          passwords: PasswordProvider.generateExampleEntries(),
        ),
      ),

      /// Notifications page
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.notifications_sharp),
              title: Text('TOTP'),
            ),
          ],
        ),
      ),
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
