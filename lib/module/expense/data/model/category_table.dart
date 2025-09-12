import 'package:drift/drift.dart';

class Categories extends Table {
  IntColumn get idCategory => integer().autoIncrement()();
  TextColumn get category => text().withLength(min: 1, max: 50)();
  TextColumn get label => text().withLength(min: 1, max: 50)();
  TextColumn get icon => text().withLength(min: 1, max: 50)();
  TextColumn get color => text().withLength(min: 4, max: 9)();
}
