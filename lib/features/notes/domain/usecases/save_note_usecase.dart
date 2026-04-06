import 'package:dartz/dartz.dart';
import 'package:note_app/core/error/failures.dart';
import 'package:note_app/features/notes/domain/entities/note_entity.dart';
import 'package:note_app/features/notes/domain/repositories/note_repository.dart';

class SaveNoteUsecase {
  final NoteRepository repo;

  SaveNoteUsecase({required this.repo});

  Future<Either<Failure, void>> call(NoteEntity note) async {
    return await repo.saveNote(note);
  }
}
