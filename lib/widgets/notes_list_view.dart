import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_state.dart';
import 'package:notes_app/cubits/search_cubit/search_State.dart';
import 'package:notes_app/cubits/search_cubit/search_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/note_item.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key, this.searchText});
  final String? searchText;
  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesStates>(
      builder: (context, state) {
        List<NoteModel> notesList =
            BlocProvider.of<NotesCubit>(context).notesList ?? [];
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: notesList.length,
                itemBuilder:
                    (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16,
                      ),
                      child:
                          notesList[index].title.toLowerCase().contains(
                                state is SearchTextChangedState
                                    ? state.searchText.toLowerCase()
                                    : '',
                              )
                              ? NoteItem(noteModel: notesList[index])
                              : notesList[index].subTitle
                                  .toLowerCase()
                                  .contains(
                                    state is SearchTextChangedState
                                        ? state.searchText.toLowerCase()
                                        : '',
                                  )
                              ? NoteItem(noteModel: notesList[index])
                              : null,
                    ),
              );
            },
          ),
        );
      },
    );
  }
}
