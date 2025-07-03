import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/edit_note_cubit/edit_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key, required this.noteModel});
  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<EditNoteCubit>(
      context,
    ).setNote(noteModel.title, noteModel.subTitle);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CustomTextField(
            controller: TextEditingController(text: noteModel.title),
            hintText: 'Title',
            onChanged: (value) {
              BlocProvider.of<EditNoteCubit>(context).title = value;
            },
          ),
          const SizedBox(height: 20),
          CustomTextField(
            controller: TextEditingController(text: noteModel.subTitle),
            hintText: 'Content',
            maxLines: 5,
            onChanged: (value) {
              BlocProvider.of<EditNoteCubit>(context).subTitle = value;
            },
          ),
        ],
      ),
    );
  }
}
