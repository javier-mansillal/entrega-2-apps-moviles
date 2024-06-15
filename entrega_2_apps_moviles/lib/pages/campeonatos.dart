import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'campeonato_detalle.dart';

class Campeonatos extends StatefulWidget {
  const Campeonatos({super.key});

  @override
  State<Campeonatos> createState() => _CampeonatosState();
}

class Campeonato {
  final int id;
  final String nombre;
  final String reglas;
  final int premio;
  final String fechaInicio;

  Campeonato(
      {required this.id,
      required this.nombre,
      required this.reglas,
      required this.premio,
      required this.fechaInicio});

  // Se crea una instancia de campeonato en base al JSON.
  factory Campeonato.fromJson(Map<String, dynamic> json) {
    return Campeonato(
      id: json['id'],
      nombre: json['nombre'],
      reglas: json['reglas'],
      premio: json['premio'],
      fechaInicio: json['fecha_inicio'],
    );
  }
}

Future<List<Campeonato>> fetchCampeonatos() async {
  final response =
      await http.get(Uri.parse('http://10.0.2.2:8000/api/campeonatos'));

  if (response.statusCode == 200) {
    // Si la llamada a la API fue exitosa, analiza el JSON
    List<dynamic> usersJson = json.decode(response.body);
    return usersJson.map((json) => Campeonato.fromJson(json)).toList();
  } else {
    // Si la llamada a la API falló, lanza una excepción
    throw Exception('Failed to load users');
  }
}

class _CampeonatosState extends State<Campeonatos> {
  late Future<List<Campeonato>> futureCampeonatos;

  @override
  void initState() {
    super.initState();
    futureCampeonatos = fetchCampeonatos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campeonatos'),
      ),
      body: Center(
        child: FutureBuilder<List<Campeonato>>(
          future: futureCampeonatos,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  final campeonato = snapshot.data![index];
                  return ListTile(
                    title: Text("${campeonato.id}. ${campeonato.nombre}"),
                    subtitle: Text(campeonato.fechaInicio),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CampeonatoDetalle(
                                    campeonato: campeonato,
                                  )));
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
