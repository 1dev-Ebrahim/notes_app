import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/edit_note_cubit/edit_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/edit_note_view_body.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.noteModel});
  static const String id = 'EditNoteView';
  final NoteModel noteModel;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditNoteCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: CustomAppBar(
              title: 'EditNotes',
              iconData: Icons.done,
              onPressed: () {
                if (BlocProvider.of<EditNoteCubit>(
                  context,
                ).formKey.currentState!.validate()) {
                  final cubit = context.read<EditNoteCubit>();
                  widget.noteModel.title = cubit.title!;
                  widget.noteModel.subTitle = cubit.subTitle!;
                  widget.noteModel.color = cubit.color.value;
                  widget.noteModel.save();
                  BlocProvider.of<NotesCubit>(context).fetchNotes();
                  Navigator.pop(context);
                } else {
                  setState(() {
                    BlocProvider.of<EditNoteCubit>(context).autovalidateMode =
                        AutovalidateMode.always;
                  });
                }
              },
            ),
            body: EditNoteViewBody(noteModel: widget.noteModel),
          );
        },
      ),
    );
  }
}
