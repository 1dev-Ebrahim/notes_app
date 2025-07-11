import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(noteModel.key.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) {
        noteModel.delete();
        BlocProvider.of<NotesCubit>(context).fetchNotes();
      },
      child: Container(
        padding: const EdgeInsets.only(
          top: 24,
          bottom: 24,
          left: 24,
          right: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(noteModel.color),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.only(right: 0),
              enableFeedback: true,
              title: Text(
                noteModel.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  noteModel.subTitle,
                  style: const TextStyle(
                    color: Color.fromARGB(125, 0, 0, 0),
                    fontSize: 18,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return EditNoteView(noteModel: noteModel);
                      },
                    ),
                  );
                },
                style: ButtonStyle(
                  splashFactory: InkRipple.splashFactory,
                  overlayColor: WidgetStateProperty.all(
                    const Color.fromARGB(34, 0, 0, 0),
                  ),
                ),
                icon: const Icon(
                  FontAwesomeIcons.penToSquare,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                noteModel.date,
                style: const TextStyle(
                  color: Color.fromARGB(125, 0, 0, 0),
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
