import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:note_app/core/error/failures.dart';
import 'package:note_app/features/notes/data/datasources/note_remote_datasource.dart';
import 'package:note_app/features/notes/domain/entities/note_entity.dart';
import 'package:note_app/features/notes/domain/repositories/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteRemoteDatasource remoteDatasource;

  NoteRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, void>> deleteNote(String id) async {
    try {
      await remoteDatasource.deleteNote(id);
      return Right(unit);
    } on SocketException {
      return Left(NetworkFailure());
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, List<NoteEntity>>> getAllNotes() async {
    try {
      final notes = await remoteDatasource.getAllNotes();
      return Right(notes);
    } on SocketException {
      return Left(NetworkFailure());
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, void>> saveNote(NoteEntity note) async {
    try {
      await remoteDatasource.saveNote(note);
      return Right(unit);
    } on SocketException {
      return Left(NetworkFailure());
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }
}
