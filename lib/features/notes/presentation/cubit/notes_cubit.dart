import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/notes/domain/entities/note_entity.dart';
import 'package:note_app/features/notes/domain/usecases/delete_note_usecase.dart';
import 'package:note_app/features/notes/domain/usecases/get_notes_usecase.dart';
import 'package:note_app/features/notes/domain/usecases/save_note_usecase.dart';
import 'package:note_app/features/notes/presentation/cubit/notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  final GetNotesUsecase getNotesUsecase;
  final SaveNoteUsecase saveNoteUsecase;
  final DeleteNoteUsecase deleteNoteUsecase;

  NotesCubit({
    required this.getNotesUsecase,
    required this.saveNoteUsecase,
    required this.deleteNoteUsecase,
  }) : super(NotesLoading());

  Future<void> getNotes() async {
    emit(NotesLoading());
    final result = await getNotesUsecase.call();
    result.fold(
      (l) => emit(NotesError(l.message)),
      (notes) => emit(NotesLoaded(notes)),
    );
  }

  Future<void> saveNote(NoteEntity note) async {
    emit(NotesLoading());
    final result = await saveNoteUsecase.call(note);
    result.fold((l) => emit(NotesError(l.message)), (r) => getNotes());
  }

  Future<void> deleteNote(String id) async {
    emit(NotesLoading());
    final result = await deleteNoteUsecase.call(id);
    result.fold((l) => emit(NotesError(l.message)), (r) => getNotes());
  }
}
