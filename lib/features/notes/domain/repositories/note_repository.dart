import 'package:dartz/dartz.dart';
import 'package:note_app/core/error/failures.dart';
import 'package:note_app/features/notes/domain/entities/note_entity.dart';

abstract class NoteRepository {
  Future<Either<Failure, List<NoteEntity>>> getAllNotes();
  Future<Either<Failure, void>> saveNote(NoteEntity note);
  Future<Either<Failure, void>> deleteNote(String id);
}
