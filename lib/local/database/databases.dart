import 'package:flutter_moor/local/database/note_dao.dart';
import 'package:flutter_moor/local/database/notes.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'databases.g.dart';

@UseMoor(tables: [Notes],daos: [NotesDao])
class Databases extends _$Databases {
  Databases()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

}
