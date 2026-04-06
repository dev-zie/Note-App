import 'package:note_app/features/notes/data/datasources/note_remote_datasource.dart';
import 'package:note_app/features/notes/domain/entities/note_entity.dart';
import 'package:note_app/features/notes/domain/repositories/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteRemoteDatasource remoteDatasource;

  NoteRepositoryImpl({required this.remoteDatasource});

  @override
  Future<void> deleteNote(String id) async {
    await remoteDatasource.deleteNote(id);
  }

  @override
  Future<List<NoteEntity>> getAllNotes() async {
    return await remoteDatasource.getAllNotes();
  }

  @override
  Future<void> saveNote(NoteEntity note) async {
    await remoteDatasource.saveNote(note);

  }
}
