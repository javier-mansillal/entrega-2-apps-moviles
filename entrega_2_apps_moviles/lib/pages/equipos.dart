import 'package:entrega_2_apps_moviles/pages/equipo_detalle.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Equipos extends StatefulWidget {
  const Equipos({super.key});

  @override
  State<Equipos> createState() => _EquiposState();
}

class Equipo {
  final int id;
  final String nombre;
  final String juego;

  Equipo({
    required this.id,
    required this.nombre,
    required this.juego,
  });
  factory Equipo.fromJson(Map<String, dynamic> json) {
    return Equipo(id: json['id'], nombre: json['nombre'], juego: json['juego']);
  }
}

Future<List<Equipo>> fetchEquipos() async {
  final response =
      await http.get(Uri.parse('http://10.0.2.2:8000/api/equipos'));

  if (response.statusCode == 200) {
    // Si la llamada a la API fue exitosa, analiza el JSON
    List<dynamic> usersJson = json.decode(response.body);
    return usersJson.map((json) => Equipo.fromJson(json)).toList();
  } else {
    // Si la llamada a la API falló, lanza una excepción
    throw Exception('Fallo en cargar equipos.');
  }
}

class _EquiposState extends State<Equipos> {
  late Future<List<Equipo>> futureEquipos;

  @override
  void initState() {
    super.initState();
    futureEquipos = fetchEquipos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Equipos'),
      ),
      body: Center(
        child: FutureBuilder<List<Equipo>>(
          future: futureEquipos,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  final equipo = snapshot.data![index];
                  return ListTile(
                    title: Text(equipo.nombre),
                    subtitle: Text(equipo.juego),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EquipoDetalle(equipo: equipo)));
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // Por defecto, muestra un indicador de carga
            return const CircularProgressIndicator(color: Colors.cyan);
          },
        ),
      ),
    );
  }
}
