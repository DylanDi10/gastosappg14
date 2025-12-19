import 'package:drift/drift.dart';
import 'package:gastosappg14/data/local/drift/tables/categories_table.dart';

class Notes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get titulo => text().withLength(min: 1, max: 100)();
  TextColumn get contenido => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  IntColumn get categoryId =>
      integer().nullable().references(Categories, #id)();
}
