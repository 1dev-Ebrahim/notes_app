import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/notes_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String id = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (contextc) => const AddNoteBottomSheet(),
              showDragHandle: true,
              isScrollControlled: true,
            );
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          backgroundColor: kPrimaryColor,
          child: const Icon(Icons.add, color: Colors.black),
        ),
        appBar: CustomAppBar(
          title: 'Notes',
          iconData: Icons.search,
          onPressed: () {},
        ),
        body: const NotesListView(),
      ),
    );
  }
}
