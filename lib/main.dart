import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/notes/data/datasources/note_remote_datasource.dart';
import 'package:note_app/features/notes/data/repositories/note_repository_impl.dart';
import 'package:note_app/features/notes/domain/usecases/delete_note_usecase.dart';
import 'package:note_app/features/notes/domain/usecases/get_notes_usecase.dart';
import 'package:note_app/features/notes/domain/usecases/save_note_usecase.dart';
import 'package:note_app/features/notes/presentation/cubit/notes_cubit.dart';
import 'package:note_app/features/notes/presentation/pages/notes_page.dart';
import 'package:note_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final firestore = FirebaseFirestore.instance;
        final remoteDatasource = NoteRemoteDatasource(firestore);
        final repository = NoteRepositoryImpl(
          remoteDatasource: remoteDatasource,
        );
        final getNotesUsecase = GetNotesUsecase(repo: repository);
        final saveNoteUsecase = SaveNoteUsecase(repo: repository);
        final deleteNoteUsecase = DeleteNoteUsecase(repo: repository);

        return NotesCubit(
          getNotesUsecase: getNotesUsecase,
          saveNoteUsecase: saveNoteUsecase,
          deleteNoteUsecase: deleteNoteUsecase,
        )..getNotes();
      },
      child: MaterialApp(theme: ThemeData.dark(), home: NotesView()),
    );
  }
}
