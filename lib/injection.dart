import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:note_app/features/notes/data/datasources/note_remote_datasource.dart';
import 'package:note_app/features/notes/data/repositories/note_repository_impl.dart';
import 'package:note_app/features/notes/domain/repositories/note_repository.dart';
import 'package:note_app/features/notes/domain/usecases/delete_note_usecase.dart';
import 'package:note_app/features/notes/domain/usecases/get_notes_usecase.dart';
import 'package:note_app/features/notes/domain/usecases/save_note_usecase.dart';
import 'package:note_app/features/notes/presentation/cubit/notes_cubit.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
  sl.registerLazySingleton(() => NoteRemoteDatasource(sl()));
  sl.registerLazySingleton<NoteRepository>(
    () => NoteRepositoryImpl(remoteDatasource: sl()),
  );
  sl.registerLazySingleton(() => GetNotesUsecase(repo: sl()));
  sl.registerLazySingleton(() => SaveNoteUsecase(repo: sl()));
  sl.registerLazySingleton(() => DeleteNoteUsecase(repo: sl()));
  sl.registerLazySingleton(
    () => NotesCubit(
      getNotesUsecase: sl(),
      saveNoteUsecase: sl(),
      deleteNoteUsecase: sl(),
    ),
  );
}
