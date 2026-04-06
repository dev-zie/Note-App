import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/notes/data/models/note_model.dart';
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
    try {
      final notes = await getNotesUsecase.call();
      emit(NotesLoaded(notes));
    } catch (e) {
      emit(NotesError(e.toString()));
    }
  }

  Future<void> saveNote(NoteEntity note) async {
    emit(NotesLoading());

    try {
      await saveNoteUsecase.call(note);
      await getNotes();
    } catch (e) {
      emit(NotesError(e.toString()));
    }
  }

  Future<void> deleteNote(String id) async {
    emit(NotesLoading());

    try {
      await deleteNoteUsecase.call(id);
      await getNotes();
    } catch (e) {
      emit(NotesError(e.toString()));
    }
  }
}
