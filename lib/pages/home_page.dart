import 'package:flutter/material.dart';
import 'package:gastosappg14/db/db_notas.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DbNotas dbnotas = DbNotas();
          // dbnotas.initDatabase();
          dbnotas.insertNota(
            "Compras del mes",
            "Comprar pan, queso pollo carne etc",
          );
        },
      ),
    );
  }
}
