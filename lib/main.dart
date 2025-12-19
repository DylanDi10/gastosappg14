import 'package:flutter/material.dart';
import 'package:gastosappg14/data/local/drift/app_database.dart';
import 'package:gastosappg14/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = AppDatabase();
  final catId = await db.categoriesDao.createCategory("Personal");
  await db.categoriesDao.createCategory("Trabajo");
  debugPrint(catId.toString());
  runApp(MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false));
}
