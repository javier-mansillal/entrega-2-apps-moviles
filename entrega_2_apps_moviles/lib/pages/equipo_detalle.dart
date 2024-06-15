import 'package:flutter/material.dart';
import 'equipos.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EquipoDetalle extends StatefulWidget {
  final Equipo equipo;

  const EquipoDetalle({super.key, required this.equipo});

  @override
  State<EquipoDetalle> createState() => _EquipoDetalleState();
}

class Jugador {
  final int id;
  final String nombre;
  final String nacionalidad;
  final int edad;
  final int equipoId;

  Jugador(
      {required this.id,
      required this.nombre,
      required this.nacionalidad,
      required this.edad,
      required this.equipoId});

  // Se crea una instancia de campeonato en base al JSON.
  factory Jugador.fromJson(Map<String, dynamic> json) {
    return Jugador(
      id: json['id'],
      nombre: json['nombre'],
      nacionalidad: json['nacionalidad'],
      edad: json['edad'],
      equipoId: json['equipoid'],
    );
  }
}

Future<List<Jugador>> fetchJugadorId(int id) async {
  final response =
      await http.get(Uri.parse('http://10.0.2.2:8000/api/jugadores/$id'));
  print("Respuesta a la llamada es: ${response.statusCode}");
  if (response.statusCode == 200) {
    // Si la llamada a la API fue exitosa, analiza el JSON
    List<dynamic> usersJson = json.decode(response.body);
    return usersJson.map((json) => Jugador.fromJson(json)).toList();
  } else {
    // Si la llamada a la API falló, lanza una excepción
    throw Exception(
        'Fallo en cargar jugadores o no se encontraron jugadores en este equipo.');
  }
}

class _EquipoDetalleState extends State<EquipoDetalle> {
  late Future<List<Jugador>> futureJugadores;

  @override
  void initState() {
    super.initState();
    print("El id del widget es: ${widget.equipo.id}");
    futureJugadores = fetchJugadorId(widget.equipo.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.equipo.nombre),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Nombre: ${widget.equipo.nombre}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Juego: ${widget.equipo.juego}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Jugadores:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            FutureBuilder<List<Jugador>>(
              future: futureJugadores,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final jugador = snapshot.data![index];
                      return ListTile(
                        title: Text("${jugador.id}. ${jugador.nombre}"),
                        subtitle: Text(
                            "Nacionalidad: ${jugador.nacionalidad} // Edad: ${jugador.edad}"),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                  return Text("${snapshot.error}");
                }

                // Por defecto, muestra un indicador de carga
                return const CircularProgressIndicator(color: Colors.cyan);
              },
            ),
          ],
        ),
      ),
    );
  }
}
