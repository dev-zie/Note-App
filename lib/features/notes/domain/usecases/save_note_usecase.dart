import 'package:note_app/features/notes/domain/entities/note_entity.dart';
import 'package:note_app/features/notes/domain/repositories/note_repository.dart';

class SaveNoteUsecase {
  final NoteRepository repo;

  SaveNoteUsecase({required this.repo});

  Future<void> call(NoteEntity note) async {
    await repo.saveNote(note);
  }
}
