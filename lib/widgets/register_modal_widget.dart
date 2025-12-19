import 'package:flutter/material.dart';
import 'package:gastosappg14/widgets/field_widget.dart.dart';
import 'package:gastosappg14/widgets/item_type_widget.dart';

class RegisterModalWidget extends StatefulWidget {
  const RegisterModalWidget({super.key});

  @override
  State<RegisterModalWidget> createState() => _RegisterModalWidgetState();
}

class _RegisterModalWidgetState extends State<RegisterModalWidget> {
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  String typeSelected = "Alimentos";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      child: Column(
        children: [
          Text("Registra el pago", style: TextStyle(fontSize: 24)),
          SizedBox(height: 12),
          FieldWidget(
            hintText: "Ingresa el título",
            controller: titleController,
          ),
          FieldWidget(
            hintText: "Ingresa el monto",
            controller: priceController,
            isNumberKeyboard: true,
          ),
          FieldWidget(
            hintText: "Ingresa la fecha",
            controller: dateController,
            function: () {
              print("Mostrar selectet picker");
            },
          ),
          ItemTypeWidget(
            data: {"name": "Alimentos", "image": "alimentos"},
            isSelected: false,
            tap: () {},
          ),
        ],
      ),
    );
  }
}
