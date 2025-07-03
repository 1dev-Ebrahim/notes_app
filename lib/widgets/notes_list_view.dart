import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_states.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<NoteModel> notesList = BlocProvider.of<NotesCubit>(context).notesList ?? [];
    return BlocBuilder<NotesCubit, NotesStates>(
      builder:
          (context, state) => Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ListView.builder(
              itemCount: notesList.length,
              itemBuilder:
                  (context, index) => const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16,
                    ),
                    child: NoteItem(),
                  ),
            ),
          ),
    );
  }
}
