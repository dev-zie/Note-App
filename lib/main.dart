import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/notes/presentation/cubit/notes_cubit.dart';
import 'package:note_app/features/notes/presentation/pages/notes_page.dart';
import 'package:note_app/firebase_options.dart';
import 'package:note_app/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NotesCubit>()..getNotes(),
      child: MaterialApp(theme: ThemeData.dark(), home: const NotesView()),
    );
  }
}
