import 'package:flutter/material.dart';
import './report_a_boar.dart';
import './to_do_after_screen.dart';
import './preview_map_screen.dart';
import './../widgets/knowledge_base.dart';

class Dashboard extends StatefulWidget {
  static const routeName = '/dashboard';

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  dynamic routes = [ToDoAfter.routeName, PreviewMapScreen.routeName, ReportABoar.routeName];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.of(context).pushNamed(routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/launcher.png'),
        title: Text('DzikApp'),
      ),
      body: KnowledgeBase(),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 40,
        selectedFontSize: 15,
        unselectedFontSize: 15,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_numbered),
            label: 'Lista zadań',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Mapa zgłoszeń',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_location_alt),
            label: 'Dodaj zgłoszenie',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange.shade800,
        onTap: _onItemTapped,
      ),
    );
  }
}
