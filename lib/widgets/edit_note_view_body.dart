import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/edit_note_cubit/edit_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  @override
  void initState() {
    BlocProvider.of<EditNoteCubit>(
      context,
    ).setNote(widget.noteModel.title, widget.noteModel.subTitle);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        autovalidateMode:
            BlocProvider.of<EditNoteCubit>(context).autovalidateMode,
        key: BlocProvider.of<EditNoteCubit>(context).formKey,
        child: Column(
          children: [
            CustomTextField(
              controller: TextEditingController(text: widget.noteModel.title),
              hintText: 'Title',
              onChanged: (value) {
                BlocProvider.of<EditNoteCubit>(context).title = value;
              },
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: TextEditingController(
                text: widget.noteModel.subTitle,
              ),
              hintText: 'Content',
              maxLines: 5,
              onChanged: (value) {
                BlocProvider.of<EditNoteCubit>(context).subTitle = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
