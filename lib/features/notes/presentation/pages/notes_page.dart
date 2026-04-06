import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/notes/presentation/cubit/notes_cubit.dart';
import 'package:note_app/features/notes/presentation/cubit/notes_state.dart';
import 'package:note_app/features/notes/presentation/pages/add_note_view.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes')),
      body: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          if (state is NotesLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is NotesLoaded) {
            return ListView.builder(
              itemCount: state.notes.length,
              itemBuilder: (context, index) {
                final note = state.notes[index];
                return ListTile(
                  title: Text(note.title),
                  subtitle: Text(note.content),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      context.read<NotesCubit>().deleteNote(note.id);
                    },
                  ),
                );
              },
            );
          }

          if (state is NotesError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNoteView()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
