import 'package:note_app/features/notes/domain/entities/note_entity.dart';
import 'package:note_app/features/notes/domain/repositories/note_repository.dart';

class GetNotesUsecase {
  final NoteRepository repo;

  GetNotesUsecase({required this.repo});

  Future<List<NoteEntity>> call() async {
    return await repo.getAllNotes();
  }
}
