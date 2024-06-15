import 'package:entrega_2_apps_moviles/pages/campeonatos.dart';
import 'package:entrega_2_apps_moviles/pages/equipos.dart';
import 'package:entrega_2_apps_moviles/pages/fechas.dart';
import 'package:entrega_2_apps_moviles/pages/partidos.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  final List<Widget> _paginas = [
    const Campeonatos(),
    const Equipos(),
    const Partidos(),
    const Fechas(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: _paginas[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        unselectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(color: Colors.cyan),
        selectedItemColor: Colors.cyan,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.stadium), label: "Campeonatos"),
          BottomNavigationBarItem(icon: Icon(Icons.groups), label: "Equipos"),
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_esports), label: "Partidos"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: "Fechas"),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
