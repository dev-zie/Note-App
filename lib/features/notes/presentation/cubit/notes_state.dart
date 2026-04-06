import 'package:equatable/equatable.dart';
import 'package:note_app/features/notes/domain/entities/note_entity.dart';

abstract class NotesState {}

class NotesLoading extends NotesState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class NotesLoaded extends NotesState with EquatableMixin {
  final List<NoteEntity> notes;
  NotesLoaded(this.notes);

  @override
  List<Object?> get props => [notes];
}

class NotesError extends NotesState with EquatableMixin {
  final String message;
  NotesError(this.message);

  @override
  List<Object?> get props => [message];
}
