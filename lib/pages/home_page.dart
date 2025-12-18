import 'package:flutter/material.dart';
import 'package:gastosappg14/db/db_notas.dart';
import 'package:gastosappg14/models/nota_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DbNotas dbnotas = DbNotas();
          // dbnotas.initDatabase();
          // dbnotas.insertNota("Tarea3", "R4alizar reportes de la investigación");
          // dbnotas.obtenerNotas().then((resultado) => print(resultado));
          // dbnotas.actualizarNota(1, "Contenido actualizado");
          // dbnotas.eliminarNota(1);

          // ---------------------- CON MODELOS------------------------
          // dbnotas.insertarNotaModel(
          //   NotaModel(
          //     titulo: "tarea1 Nota model",
          //     contenido:
          //         "Esta es una nota creaada desde una isntancia de Nota model",
          //   ),
          // );

          dbnotas.obtenerNotasModel().then((notas) => print(notas));
        },
      ),
    );
  }
}
