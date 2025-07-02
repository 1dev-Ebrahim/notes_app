import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});
  static const String id = 'EditNoteView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Edit Note',
        iconData: Icons.done,
        onPressed: () {
          BlocProvider.of<NotesCubit>(context).printCreated();
        },
      ),
      body: const EditNoteViewBody(),
    );
  }
}
