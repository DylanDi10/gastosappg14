import 'package:flutter/material.dart';
import 'package:gastosappg14/db/db_admin_gastos.dart';
import 'package:gastosappg14/db/db_notas.dart';
import 'package:gastosappg14/models/gasto_model.dart';
import 'package:gastosappg14/models/nota_model.dart';
import 'package:gastosappg14/widgets/custom_card_item.dart';
import 'package:gastosappg14/widgets/field_widget.dart.dart';
import 'package:gastosappg14/widgets/register_modal_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  List<GastoModel> gastosList = [];
  List<GastoModel> filteredGastos = [];

  Future<void> getDataFromDB() async {
    gastosList = await DbAdminGastos().obtenerGastos();
    // inicializamos la lista filtrada con todos los gastos
    filteredGastos = List.from(gastosList);
    setState(() {});
  }

  void showRegisterModal() {
    showModalBottomSheet(
      isScrollControlled:
          true, //Permite que el modal use más altura, incluso el 100% de la pantalla
      context: context,
      builder: (BuildContext context) {
        // Cuando usamos forms dentro del shotmodalbotton debemos poner encerrar todo en un pading de la siguiente forma para que no se tape en contenido
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: RegisterModalWidget(),
        );
      },
    ).then((value) {
      getDataFromDB();
    });
  }

  void _applyFilter() {
    final q = searchController.text.trim().toLowerCase();
    setState(() {
      if (q.isEmpty) {
        filteredGastos = List.from(gastosList);
      } else {
        filteredGastos = gastosList
            .where((e) => e.title.toLowerCase().contains(q))
            .toList();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getDataFromDB();
    // Listener sencillo al controller para filtrar por título (contains, case-insensitive)
    searchController.addListener(_applyFilter);
  }

  @override
  void dispose() {
    searchController.removeListener(_applyFilter);
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      showRegisterModal();
                    },
                    child: Container(
                      color: Colors.black,
                      width: double.infinity,
                      height: 110,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            "Agregar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(25),
                        ),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            "Resumen de gastos",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            "Gestiona tus gastos de mejor forma",
                            style: TextStyle(color: Colors.grey),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: FieldWidget(
                              controller: searchController,
                              hintText: "Buscar por título",
                            ),
                          ),

                          Expanded(
                            child: ListView.builder(
                              itemCount: filteredGastos.length,
                              itemBuilder: (BuildContext context, int index) {
                                return CustomCardItem(
                                  gastoModel: filteredGastos[index],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 90),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}