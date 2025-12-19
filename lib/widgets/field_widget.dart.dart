import 'package:flutter/material.dart';

class FieldWidget extends StatelessWidget {
  final String hintText;
  TextEditingController controller;
  bool isNumberKeyboard;
  VoidCallback? function;

  FieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.isNumberKeyboard = false,
    this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextField(
        controller: controller,
        onTap: function,
        readOnly: function != null ? true : false,
        keyboardType: isNumberKeyboard
            ? TextInputType.number
            : TextInputType.text,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade200,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade500),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
