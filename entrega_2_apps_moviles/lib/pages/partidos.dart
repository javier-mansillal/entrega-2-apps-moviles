import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Partidos extends StatefulWidget {
  const Partidos({super.key});

  @override
  State<Partidos> createState() => _CampeonatosState();
}

class Partido {
  final int id;
  final String fecha;
  final int jugado;
  final int campeonatoId;

  Partido({
    required this.id,
    required this.fecha,
    required this.jugado,
    required this.campeonatoId,
  });

  // Se crea una instancia de campeonato en base al JSON.
  factory Partido.fromJson(Map<String, dynamic> json) {
    return Partido(
      id: json['id'],
      fecha: json['fecha'],
      jugado: json['jugado'],
      campeonatoId: json['campeonatoid'],
    );
  }
}

Future<List<Partido>> fetchPartido() async {
  final response =
      await http.get(Uri.parse('http://10.0.2.2:8000/api/partidos'));

  if (response.statusCode == 200) {
    // Si la llamada a la API fue exitosa, analiza el JSON
    List<dynamic> usersJson = json.decode(response.body);
    return usersJson.map((json) => Partido.fromJson(json)).toList();
  } else {
    // Si la llamada a la API falló, lanza una excepción
    throw Exception('Fallo en cargar los partidos.');
  }
}

class _CampeonatosState extends State<Partidos> {
  late Future<List<Partido>> futureCampeonatos;

  @override
  void initState() {
    super.initState();
    futureCampeonatos = fetchPartido();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Partidos'),
      ),
      body: Center(
        child: FutureBuilder<List<Partido>>(
          future: futureCampeonatos,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  final partido = snapshot.data![index];
                  return ListTile(
                    title: Text("Partido Nro.${partido.id}(${partido.fecha})"),
                    subtitle:
                        Text("Del Campeonato Nro.${partido.campeonatoId}"),
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
