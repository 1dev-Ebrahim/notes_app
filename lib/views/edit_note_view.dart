import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, /*required this.noteModel*/});
  // final NoteModel noteModel;
  static const String id = 'EditNoteView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Edit Note',
        iconData: Icons.done,
        onPressed: () {},
      ),
      body: const EditNoteViewBody(),
    );
  }
}
