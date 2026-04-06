import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_app/features/notes/data/models/note_model.dart';
import 'package:note_app/features/notes/domain/entities/note_entity.dart';

class NoteRemoteDatasource {
  final FirebaseFirestore db;
  NoteRemoteDatasource(this.db);

  Future<List<NoteModel>> getAllNotes() async {
    final snapshot = await db.collection('notes').get();
    return snapshot.docs.map((e) => NoteModel.fromMap(e.data(), e.id)).toList();
  }

  Future<void> saveNote(NoteEntity note) async {
    final noteModel = NoteModel(
      id: note.id,
      title: note.title,
      content: note.content,
      createdAt: note.createdAt,
    );
    await db.collection('notes').add(noteModel.toMap());
  }

  Future<void> deleteNote(String id) async {
    await db.collection('notes').doc(id).delete();
  }
}
