import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/notes_list_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const String id = 'HomeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (contextc) => const AddNoteBottomSheet(),
            showDragHandle: true,
            isScrollControlled: true,
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: kPrimaryColor,
        child: const Icon(Icons.add, color: Colors.black),
      ),
      appBar: CustomAppBar(
        title: 'Notes',
        iconData: Icons.search,
        onPressed: () {},
      ),
      body: const NotesListView(),
    );
  }
}
