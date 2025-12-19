import 'package:flutter/material.dart';

Future<DateTime?> pickDate({
  required BuildContext context,
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
}) async {
  return await showDatePicker(
    context: context,
    firstDate: firstDate ?? DateTime(2020),
    lastDate: lastDate ?? DateTime(2030),
    initialDate: initialDate ?? DateTime.now(),
    builder: (context, child) {
      return Theme(
        data: ThemeData.light().copyWith(
          dialogTheme: DialogThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(16),
            ),
          ),
          colorScheme: ColorScheme.light(
            primary: Colors.red, //header y selección
            onPrimary: Colors.white, //texto del header
            onSurface: Colors.black, //teto del calendario
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(foregroundColor: Colors.red),
          ),
        ),

        child: child!,
      );
    },
  );
}
