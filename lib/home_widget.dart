import 'package:bovcria/Content.dart';
import 'package:bovcria/Info.dart';
import 'package:bovcria/Start.dart';
import 'package:flutter/material.dart';
import 'package:bovcria/l10n/app_localizations.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  int _currentIndex = 0;
  final List<Widget> _children = [
    Start(),
    Content(),
    Info(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BovCria'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: (AppLocalizations.of(context)!.inicio),
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              label: (AppLocalizations.of(context)!.helloWorld)),
          new BottomNavigationBarItem(
              icon: Icon(Icons.info), label: ('Info')),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
