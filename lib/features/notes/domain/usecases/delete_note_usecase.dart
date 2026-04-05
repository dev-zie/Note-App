import 'package:note_app/features/notes/domain/repositories/note_repository.dart';

class DeleteNoteUsecase {
  final NoteRepository repo;

  DeleteNoteUsecase({required this.repo});

  Future<void> call(String id) async {
    await repo.deleteNote(id);
  }
}
