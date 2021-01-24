import 'package:flutter_moor/local/database/databases.dart';
import 'package:moor_flutter/moor_flutter.dart';

class Notes extends Table {
  IntColumn get id => integer().autoIncrement().named('id')();

  TextColumn get title => text().named('title').customConstraint('titles')();

  TextColumn get desc => text().named('desc').customConstraint('desc')();



}
