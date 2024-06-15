import 'package:flutter/material.dart';
import 'campeonatos.dart';
// Asegúrate de importar tu modelo

class CampeonatoDetalle extends StatelessWidget {
  final Campeonato campeonato;

  const CampeonatoDetalle({super.key, required this.campeonato});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(campeonato.nombre),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Nombre: ${campeonato.nombre}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Reglas: ${campeonato.reglas}'),
            SizedBox(height: 8),
            // Añade otros campos de `campeonato` que quieras mostrar
            Text('Fecha: ${campeonato.fechaInicio}'),
            Text('Premio: ${campeonato.premio}') // Ejemplo
          ],
        ),
      ),
    );
  }
}
