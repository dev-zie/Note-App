import 'package:dartz/dartz.dart';
import 'package:note_app/core/error/failures.dart';
import 'package:note_app/features/notes/domain/repositories/note_repository.dart';

class DeleteNoteUsecase {
  final NoteRepository repo;

  DeleteNoteUsecase({required this.repo});

  Future<Either<Failure, void>> call(String id) async {
    return await repo.deleteNote(id);
  }
}
