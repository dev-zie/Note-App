import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/notes/domain/entities/note_entity.dart';
import 'package:note_app/features/notes/presentation/cubit/notes_cubit.dart';

class AddNoteView extends StatefulWidget {
  const AddNoteView({super.key});

  @override
  State<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(label: Text('Title')),
            ),
            SizedBox(height: 10),
            TextField(
              controller: contentController,
              decoration: InputDecoration(label: Text('Content')),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final note = NoteEntity(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  title: titleController.text,
                  content: contentController.text,
                  createdAt: DateTime.now(),
                );

                context.read<NotesCubit>().saveNote(note);

                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
