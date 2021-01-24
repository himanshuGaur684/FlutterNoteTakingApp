import 'package:flutter_moor/local/database/databases.dart';
import 'package:flutter_moor/local/database/notes.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'note_dao.g.dart';

@UseDao(tables: [Notes])
class NotesDao extends DatabaseAccessor<Databases> with _$NotesDaoMixin {
  NotesDao(Databases attachedDatabase) : super(attachedDatabase);


  Stream<List<Note>> observeAllNotes() => select(notes).watch();

  Future<List<Note>> getAllNotes() => select(notes).get();

  Future insertNote(Note note) => into(notes).insert(note);

  Future deleteNote(Note note) => delete(notes).delete(note);



}
