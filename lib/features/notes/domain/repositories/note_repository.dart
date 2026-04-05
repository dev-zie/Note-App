import 'package:note_app/features/notes/domain/entities/note_entity.dart';

abstract class NoteRepository {
  Future<List<NoteEntity>> getAllNotes();
  Future<void> saveNote(String title, String content, DateTime time);
  Future<void> deleteNote(String id);
}
